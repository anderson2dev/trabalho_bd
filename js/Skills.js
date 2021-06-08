const {v4} = require('uuid');

class Skills {
    #users_id = [];
    #id = [];
    #skills_name = ['futebol', 'java', 'javascript', 'c', 'c++', 'dança', 'comunicacao', 'videogame'];
    constructor(users) {   
        users.id.forEach(id => this.#users_id.push(id));
        this.#users_id.forEach(() => {
            this.#id.push(v4());
        })
    }

    #generateSkillName() {
        const skill_name_index = Math.floor(Math.random()* this.#skills_name.length);
        return `'${this.#skills_name[skill_name_index]}'`;
    }

    generateInserts() {
        let stmt = "INSERT INTO habilidades(id, id_usuario, nome) values ";
        this.#id.forEach((id, index) => {
            stmt+=`('${id}', '${this.#users_id[index]}', ${this.#generateSkillName()})`;
            if(index === this.#id.length - 1) 
                stmt+=';';
            else
                stmt+=',\n';
        })
        return stmt;
    }
}

module.exports = Skills;