import  dbClient  from"../service/dbClient.js";

export default{
    async getAllCategories (_,res){
        const sqlQuery = `SELECT name from category;`
        try {
            const response = await dbClient.query(sqlQuery);
            res.json(response.rows);
        }
        catch(error){
            return (new Error('problème de lecture de la BDD', error));
        }
    }
}



