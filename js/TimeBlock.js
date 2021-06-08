const {v4} = require('uuid');

class TimeBlock {
    
    #mentors_id = [];
    #time_blocks_id = [];

    constructor(user, number_of_time_blocks) {
        this.#mentors_id = user.mentors_id;
        for(let i = 1; i<= number_of_time_blocks; i++) {
            this.#time_blocks_id.push(v4());
        }
    }

    #generateMentorId() {
        const mentor_index = Math.floor(Math.random()*this.#mentors_id.length);
        return `'${this.#mentors_id[mentor_index]}'`;
    }

    
    #generateDateTimeStamp() {
        const date = Math.floor(Math.random()*30);
        const month = Math.floor(Math.random()*12);
        const year = 2000 + Math.floor(1+Math.random()*25);
        const hours = Math.floor(Math.random()*23);
        const minutes = Math.floor(Math.random()*59);
        const seconds = Math.floor(Math.random()*59);
        return `$${year}-${month}-${date} ${hours}:${minutes}:${seconds}`; 
    }

    #generateBeginAndEnd() {
        let begin = new Date(this.#generateDateTimeStamp());
        let end = new Date(this.#generateDateTimeStamp());
        let aux;
        const ms_1 = begin.getTime();
        const ms_2 = end.getTime();
        if( ms_1>= ms_2 ) {
            aux = begin;
            begin = end;
            end = aux;
        } 
        return [
            begin.toLocaleDateString("PT-BR") + ' ' + begin.toLocaleTimeString('PT-BR'),
            end.toLocaleDateString("PT-BR") + ' ' + end.toLocaleTimeString('PT-BR')
        ];
    }

    generateInserts() {
        let stmt = "INSERT INTO bloco_tempo (id, id_mentor, inicio, fim) values ";
        this.#time_blocks_id.forEach((time_block_id, i) => {
                const [begin, end] = this.#generateBeginAndEnd();
                stmt += `('${time_block_id}', ${this.#generateMentorId()}, '${begin}', '${end}')`
                if (i==this.#time_blocks_id.length-1) 
                    stmt+=';\n';
                else 
                    stmt+=',\n';
            }
        ) 
        return stmt;
    }

    get mentorsId() {
        return this.#mentors_id;
    }

    get timeBlockIds() {
        return this.#time_blocks_id;
    }
}

module.exports = TimeBlock;