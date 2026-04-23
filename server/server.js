require('dotenv').config(); 
//perimite que os dados do .env sejam utilizados nesse arquivo
const express = require('express');
//importa o express
const pool = require('./db/connection');
//importa o pool de conexões do "connection.js"

const app = express();
//cria a aplicação Express ".app", sendo o objeto principal do  servidor (tudo passa por ele, configs de middleware, registro de rotas e requisições)
const PORT = process.env.PORT || 3000;
// Lê a porta definida no arquivo .env

async function iniciar() { //função async (porque usamos o wait, visto que a conexão do com o banco leva tempo), para conectar com o banco de dados 
    try {
        const conn = await pool.getConnection(); // pega uma conexão disponível no pool, e tenta conectar
        console.log('Banco de dados conectado com sucesso!');
        conn.release();// já que é uma conexão teste, a conexão é devolvida para o pool

        app.listen(PORT, () => {// permite que o servidor escute as requisições no PORT
            console.log('Servidor rodando em http://localhost:', PORT);
        });
    } catch (erro) {// caso ocorra um erro a execução durante o try a execução pula para esse "catch"
        console.error('Erro ao conectar ao banco', erro.mensage);
        process.exit(1);//
    }
}

iniciar();

// Se aparecer "Acess denied for user 'root'", a senha no .env está errada
// Se aparecer "Unknown database 'surfco'" o banco ainda não foi criado
// Se aparecer "ECONNREFUSED" o MySQL está desligado