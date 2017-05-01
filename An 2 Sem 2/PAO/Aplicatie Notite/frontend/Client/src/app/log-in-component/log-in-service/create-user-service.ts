
import {Injectable} from "@angular/core";
import {URL} from "../../shared/URL";
import {Http, Response} from "@angular/http";
import 'rxjs/Rx';
import {Observable} from "rxjs";

@Injectable()
export class CreateUserService{

  url =  URL + "/createUser";

  constructor(private http : Http){

  };

  createUser() : Observable<any>{
    console.log(this.url);
    let resp = this.http.get(this.url).
                map(res => res.json()).
                catch(this.handleError);
    return resp;
  }

  // why this shit doesn't work???
  private extractData(res : Response){
    let body = res.json();
    // aha ! no data on boby
    return body.data || { } ;
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
