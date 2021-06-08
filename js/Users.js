/** Gera o mockdata de usuários */

const {v4} = require('uuid');

class Users {

    #mentees_id = [];
    #mentors_id = [];
    #first_names = [ 'Mohamed', 'Youssef', 'Ahmed', 'Mahmoud', 'Mustafa', 'Yassin', 'Taha', 'Khaled', 'Hamza', 'Bilal', 'Ibrahim', 'Hassan', 'Hussein', 'Karim', 'Tareq', 'Abdel'-'Rahman', 'Ali', 'Omar', 'Halim', 'Murad', 'Selim', 'Abdallah' ];

    #last_names = ['Diaz', 'Parker', 'Cruz', 'Edwards', 'Collins', 'Reyes', 'Stewart', 'Morris', 'Morales', 'Murphy', 'Cook', 'Rogers', 'Gutierrez', 'Ortiz', 'Morgan', 'Cooper', 'Peterson', 'Bailey', 'Reed', 'Kelly', 'Howard', 'Ramos', 'Kim', 'Cox', 'Ward', 'Richardson', 'Watson', 'Brooks', 'Chavez', 'Wood', 'James', 'Bennet', 'Gray', 'Mendoza', 'Ruiz', 'Hughes', 'Price', 'Welsh', 'Alvarez', 'Castillo', 'Sanders', 'Patel', 'Myers', 'Long', 'Ross'];
    
    #user_types = ['MENTOR', 'MENTORADO'];

    #emails_provider = ['@gmail.com', '@hotmail.com', '@ufba.com', '@org.com', '@rus.io'];
    
    constructor(number_of_mentors, number_of_mentees) {
        for (let i = 0; i<number_of_mentors; i++) {
            this.#mentors_id.push(v4());
        }

        for (let i = 0; i<number_of_mentees; i++) {
            this.#mentees_id.push(v4());
        }
    }


    #generateNames() {
            const first_name_index  = Math.floor(Math.random()* this.#first_names.length);
            const last_name_index = Math.floor(Math.random()*this.#last_names.length);
            return `'${this.#first_names[first_name_index]} ${this.#last_names[last_name_index]}'`;

    }

    #generateUserType() {
        const user_type_index = Math.floor(Math.random()*this.#user_types.length);
        return `'${this.#user_types[user_type_index]}'`;
    }

    #generateEmails() {
        const user_name_index = Math.floor(Math.random()*(this.#first_names.length-1));
        const user_email_provider_index = Math.floor(Math.random()*(this.#emails_provider.length-1));
        return `'${this.#first_names[user_name_index]}${this.#emails_provider[user_email_provider_index]}'`
    }

    #generateBirthDatesTimeZone() {
       const day = Math.floor(Math.random()*27);
        const month = Math.floor(Math.random()*12);
        const year = 2000 + Math.floor(Math.random()*25);
        const hours = Math.floor(Math.random()*23);
        const minutes = Math.floor(Math.random()*59);
        const seconds = Math.floor(Math.random()*59);
        const date = new Date(`${year}-${month}-${day} ${hours}:${minutes}:${seconds}`);
        return `'${date.toLocaleDateString("PT-BR")} ${date.toLocaleTimeString("PT-BR")}'`; 
    }

    #generatePasswords(password_size) {
        let password = "";
        const alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'x', 'w', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
        for (let i = 0; i<password_size; i++) {
            const alphabet_index = Math.floor(Math.random()*alphabet.length);
            password+=alphabet[alphabet_index];
        }
        return `'${password}'`;
    }

    generateInserts() {
        const MIN_PASSWORD_SIZE = 10;

        let stmt = "INSERT INTO usuarios (id, tipo, email, senha, nome, nascimento) values ";
     
        /** GERA OS MENTORES */
        for(let i = 0; i<this.#mentors_id.length; i++) {
            stmt += `('${this.#mentors_id[i]}', 'MENTOR', ${this.#generateEmails()}, ${this.#generatePasswords(MIN_PASSWORD_SIZE)},${this.#generateNames()}, 
            ${this.#generateBirthDatesTimeZone()})`
            stmt+=',\n';
        }
        /** GERA OS MENTORADOS */
        for(let i = 0; i<this.#mentees_id.length; i++) {
            stmt += `('${this.#mentees_id[i]}', 'MENTORADO',  ${this.#generateEmails()}, ${this.#generatePasswords(MIN_PASSWORD_SIZE)},${this.#generateNames()}, 
            ${this.#generateBirthDatesTimeZone()})`;
            /** Insere ; no final da query */
            if (i==this.#mentees_id.length - 1) 
                stmt+=';';
            else 
                stmt+=',\n';
        }   
        return stmt;
    }

    get mentors_id() {
        return this.#mentors_id;
    }

    get mentees_id()  {
        return this.#mentees_id;
    }

    get id() {
        return  [
            ...this.#mentors_id,
            ...this.#mentees_id
        ];
    }
}

module.exports = Users;
