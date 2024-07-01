import { makeAutoObservable } from 'mobx'


class RecommendationStore {
    _products = []

    constructor() {
        makeAutoObservable(this);
    }

    get products() {
        return this._products
    }
    set products(products){
        this._products = products;
    }
}
export default RecommendationStore