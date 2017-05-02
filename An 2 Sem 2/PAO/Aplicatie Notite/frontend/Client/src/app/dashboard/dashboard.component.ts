import { Component, OnInit } from '@angular/core';
import {CreateNoteService} from "./dashboard-service/create-note.service";
import {UpdateNoteService} from "./dashboard-service/update-note.service";
import {Http} from "@angular/http";
import {Note} from "../pojos/note";
import {GetAllNotesService} from "./dashboard-service/get-all-notes-by-user.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  noteCreated : boolean;
  showUpdateField : boolean;
  selectedNote : Note ;
  notes : Note[] = [];


  constructor(
    private createNoteService : CreateNoteService,
    private updateNoteService : UpdateNoteService,
    private getNoteService : GetAllNotesService,
    private http : Http,
    private router : Router
  ) { }

  ngOnInit() {

    this.getNotes();

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

    this.createNoteService.createNote(note)
      .subscribe(
        body => {console.log(body) ;
                 this.noteCreated = true; },
        error => console.log(error.toString())
      );
    this.getNotes();
  }

  getNotes(){

    this.getNoteService.getNotes()
      .subscribe(
        body => {
          console.log(
            JSON.stringify(body));
          this.notes = JSON.parse(JSON.stringify(body));
        },
        error => console.log(error.toString())
      )
  }





  getLink(id : number){
    this.router.navigate(['/getNote',id]);
  }

  showUpdateNote(note : Note){

    this.selectedNote = note;

  }

  updateNote(text : string, password : string ){

      let note : Note = new Note();
      note.id = this.selectedNote.id;
      note.text = text ;
      note.user = this.selectedNote.user;
      if(password !== null && password !== undefined && password !== ""){
        note.hasPassword = true;
        note.password = password;
      }else{
        note.hasPassword = false;
        note.password = "any";
      }
      this.updateNoteService.updateNote(note)
        .subscribe(
          body => console.log(body),
          error => console.log(error)
        );

      this.getNotes();
    }


}
