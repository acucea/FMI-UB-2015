import {URL} from "../../shared/URL";
import {Injectable} from "@angular/core";
import {Http, Response, RequestOptions, Headers, URLSearchParams} from "@angular/http";
import {Observable} from "rxjs";

@Injectable()
export class LogInService{

    url = URL + "/login";

    constructor(private http : Http){

    }

    loginUser(user : string) : Observable<any>{


      let headers = new Headers({ 'Content-Type': 'application/json' });
      let options = new RequestOptions({ headers: headers });

      let body = JSON.stringify({ user : user });

      return this.http.post(this.url, body ,options)
        .map(res => res.json())
        .catch(this.handleError)
    }

  private handleError (error: Response | any) {
    // In a real world app, you might use a remote logging infrastructure
    console.log("eroor");
    let errMsg: string;
    if (error instanceof Response) {
      const body = error.json() || '';
      const err = body.error || JSON.stringify(body);
      errMsg = `${error.status} - ${error.statusText || ''} ${err}`;
    } else {
      errMsg = error.message ? error.message : error.toString();
    }
    console.error(errMsg);
    return Observable.throw(errMsg);
  }






}
