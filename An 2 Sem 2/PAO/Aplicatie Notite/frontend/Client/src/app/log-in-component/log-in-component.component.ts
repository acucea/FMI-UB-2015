import { Component, OnInit } from '@angular/core';
import {Http} from "@angular/http";
import {LogInService} from "./log-in-service/log-in-service";
import {CreateUserService} from "./log-in-service/create-user-service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-log-in-component',
  templateUrl: './log-in-component.component.html',
  styleUrls: ['./log-in-component.component.css']
})
export class LogInComponentComponent implements OnInit {


  username : string ;
  errorMessage : string ;
  loggedIn : boolean ;
  loggedInFailed : boolean;

  constructor(private http : Http ,
              private createUserService : CreateUserService,
              private loginUserService : LogInService,
              private router : Router) {

  }


  ngOnInit() {

  }

  public createAccount() : void {
    this.createUserService.createUser()
      .subscribe(
        body => {this.username = body.username;
                  console.log(this.username);
                  console.log(body);},
        error => this.errorMessage = <any>error );
  }

  public loginUser(user : string) : void{
    console.log(user);
    this.loginUserService.loginUser(user)
      .subscribe(
          body => {

            this.loggedIn = body.logged;

            if(this.loggedIn === false){
              this.loggedInFailed = true;
            }else{
              localStorage.setItem("notesUser",user);
              this.router.navigate(['/dashboard']);
            }
            console.log(body);
          },
          error => this.errorMessage = <any>error );
  }


}
