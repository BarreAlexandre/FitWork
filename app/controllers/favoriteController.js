import favoriteMapper from "../DataMapper/favoriteMapper.js";

export default{

    async getUserFavorite(req,res,next){
        try{
            const foundFavorite = await favoriteMapper.getFavorite(req.params.id);
            if(!foundFavorite){
                throw "Le Favoriteme est vide."
            }
                res.json(foundFavorite);
            }
            catch (error) {
                console.log('getUSerFavorite-error : ', error);
                next (error);
        }
    },

    async postArticleFavorite(req,res,next){
        const userId = req.body.user_id
        const articleId = req.params.id
        try{
            const postArticleInFavorite = await favoriteMapper.addToFavorite(userId,articleId);
            if(!postArticleInFavorite){
                throw "L'article est déjà présent dans Favoris."
            }
                res.json(postArticleInFavorite);
            }
            catch (error) {
                console.log('postUSerFavorite-error : ', error);
                next (error);
        }
    },
    
    async deleteArticleFavorite(req,res,next){
        try{
            const deleted = await favoriteMapper.deleteFromFavorite(req.params.id);
            if(deleted){
                console.log( 'deleted : ',deleted)
                throw "Impossible de supprimer l'article des Favoris."
            }
                res.json("deleted");
            }
        catch(error) {
            console.log('deleteUSerFavorite-error : ', error);
            next (error);
        }
    }
}


