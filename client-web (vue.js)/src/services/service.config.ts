import axios, {AxiosPromise} from 'axios'

export const HTTP = axios.create({
    baseURL: 'http://localhost:3000/',
    headers: { 'content-type': 'application/json' }
})

HTTP.interceptors.request.use(function (config: any) {
    console.log("http request")
    return config
})

export class ClubsService {
    static getAllClubs (): AxiosPromise<any> {
        return HTTP.get('clubs')
    }
}

export class FoodMenuService {
    static getFoodMenu (): AxiosPromise<any> {
        return HTTP.get('foodmenu')
    }
}
