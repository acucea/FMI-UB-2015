import { Component, OnInit } from '@angular/core';
import {CreateNoteService} from "./dashboard-service/create-note.service";
import {UpdateNoteService} from "./dashboard-service/update-note.service";
import {Http} from "@angular/http";
import {Note} from "../pojos/note";

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  constructor(
    private createNoteService : CreateNoteService,
    private updateNoteService : UpdateNoteService,
    private http : Http
  ) { }

  ngOnInit() {

  }

  createNote(text : string, password : string) : void {
    let note : Note = new Note();
    note.text = text ;
    if(password !== null && password !== undefined && password != ""){
      note.hasPassword = true;
      note.password = password;
    }else{
      note.hasPassword = false;
      note.password = "any";
    }
    note.user  = localStorage.getItem("notesUser");

    this.createNoteService.createNote(note);


  }

  getLink(){

  }

}
