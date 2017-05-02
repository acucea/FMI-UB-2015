import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import {HttpModule, JsonpModule} from '@angular/http';

import { AppComponent } from './app.component';
import { LogInComponentComponent } from './log-in-component/log-in-component.component';
import {CreateUserService} from "./log-in-component/log-in-service/create-user-service";
import {LogInService} from "./log-in-component/log-in-service/log-in-service";
import {RouterModule} from "@angular/router";
import { DashboardComponent } from './dashboard/dashboard.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import {CreateNoteService} from "./dashboard/dashboard-service/create-note.service";
import {UpdateNoteService} from "./dashboard/dashboard-service/update-note.service";
import {GetAllNotesService} from "./dashboard/dashboard-service/get-all-notes-by-user.service";
import { ViewNoteComponent } from './view-note/view-note.component';
import {GetNoteByIdService} from "./view-note/view-note.services/get-note-by-id.service";

const appRoutes = [
  {
    path: 'login' , component : LogInComponentComponent
  },
  {
    path: 'dashboard' , component : DashboardComponent
  },
  {
    path: 'getNote/:id' , component : ViewNoteComponent
  },
  {
    path: '', redirectTo : 'login', pathMatch: 'full'
  },
  {
    path: '**' , component : PageNotFoundComponent
  }
];


@NgModule({
  declarations: [
    AppComponent,
    LogInComponentComponent,
    DashboardComponent,
    PageNotFoundComponent,
    ViewNoteComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    JsonpModule,
    RouterModule.forRoot(appRoutes)
  ],
  providers: [CreateUserService,
              LogInService,
              CreateNoteService,
              UpdateNoteService,
              GetAllNotesService,
              GetNoteByIdService
                             ],
  bootstrap: [AppComponent]
})
export class AppModule { }
