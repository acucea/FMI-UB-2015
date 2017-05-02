import { Component, OnInit } from '@angular/core';
import {Note} from "../pojos/note";
import {GetNoteByIdService} from "./view-note.services/get-note-by-id.service";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-view-note',
  templateUrl: './view-note.component.html',
  styleUrls: ['./view-note.component.css']
})
export class ViewNoteComponent implements OnInit {

  wrongPassword : boolean;
  showNote : boolean ;
  note : Note ;
  id : number;
  private sub : any;


  constructor(private getNoteByIdService : GetNoteByIdService,
              private route : ActivatedRoute) { }

  ngOnInit() {
    this.sub = this.route.params.subscribe(
      params => {this.id = +params['id'];}
    );
    this.getNoteByIdService.getNoteById(this.id)
      .subscribe(
        body =>{
          this.note = JSON.parse(JSON.stringify(body));
          if(!this.note.hasPassword){
            this.showNote = true;
          }
        },
        error => {console.log(error)}
      );

  }
  
  checkPassword(password : string ){
    if(this.note.password = password){
      this.showNote = true;
    }else{
      this.wrongPassword = true;
    }
  }

}
