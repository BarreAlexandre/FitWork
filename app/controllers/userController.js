import  dbClient  from"../service/dbClient.js";
import bcrypt from "bcryptjs";
/**
* Cherche un utilisateur par son ID (SQL)
* @param {text} email 
*/
async function findOneByEmail(email){
        const sqlQuery= `SELECT * FROM "user" WHERE email=$1;`;
        const value= [email];
        try {
            const response = await dbClient.query (sqlQuery,value);
            return response.rows[0];
        } 
        catch (err){
            console.error(err)
        }
        };

export default {
    /**
     * CHerche un utilisateur par son ID
     * @param {*} req 
     * @param {*} res 
     * @param {*} next 
     */
    async getUserById(req,res,next){
        const sqlQuery= `SELECT * FROM "user" WHERE id=$1;`;
        const value= [req.params.id];
        try {
            const response = await dbClient.query (sqlQuery,value);
            res.json (response.rows[0]);
        } 
        catch (err){
            next(new Error("problème de lecture BDD/User"))
        };
    },
    /**
     * Crée un utilisateur depuis un JSON
     * @param {*} req 
     * @param {*} res 
     * @param {*} next 
     */
    async createUser(req,res,next){
        const user = req.body;
        const foundUser = await findOneByEmail(user.email)
        if (foundUser){
            console.log('user trouvé');
            res.json('Adresse email déjà utilisée.');
        }
            const saltRounds=12;
            const hash = await bcrypt.hash(user.password,saltRounds);
            // user.password=NULL;
            const sqlQuery =`INSERT INTO "user" ("firstname","lastname","email","birth_date","password","role_id") VALUES ($1,$2,$3,$4,$5,$6);`;    
            const values=[user.firstname, user.lastname,user.email,user.birth_date,hash,2];
        try{
            await dbClient.query(sqlQuery,values);
            return 'ok';
        }
        catch(error){
            next (new Error('problème de création sur la BDD',error));
        }
    },

    async updateUser(req,res,next){
        const user = await this.getUserById(req.params.id);
        if(user){
            const sqlQuery = `UPDATE "user" SET
                        "firstname" = COALESCE($1, firstname),
                        "lastname" = COALESCE($2, lastname),
                        "email" = COALESCE($3, email),
                        "birth_date" = COALESCE($4, birth_date)
                        WHERE id=$5::int RETURNING (firstname,lastname,email,birth_date);`
        const values =[body.firstname,body.lastname,body.email,body.birth_date,userId];
        try {
            const response = await dbClient.query (sqlQuery,values);
            return response;
        } catch (err){
            next (new Error('problèmer de connection a la BDD',err));
        }
    }
    },

    async deleteUser(req,res,next){
        const user = await this.getUserById(req.params.id)
        if(user){
            const sqlQuery= `DELETE FROM "user" WHERE id=$1`;
            const value= [id];
            try {
                console.log('dans le try du model/delete');
                await dbClient.query (sqlQuery,value);
                return 'done';
            } catch (err){
                next (new Error('problème de suppression de l\'utilisateur sur la BDD'));
            }

        } else {
            res.json ('utilisateur non trouvé');
        }
}
}