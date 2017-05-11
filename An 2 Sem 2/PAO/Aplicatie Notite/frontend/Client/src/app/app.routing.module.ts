

import {PageNotFoundComponent} from "./page-not-found/page-not-found.component";
import {ViewNoteComponent} from "./view-note/view-note.component";
import {DashboardComponent} from "./dashboard/dashboard.component";
import {LogInComponentComponent} from "./log-in-component/log-in-component.component";
import {NgModel} from "@angular/forms";
import {RouterModule} from "@angular/router";
import {NgModule} from "@angular/core";
const appRoutes = [
  {
    path: '', redirectTo : '/login', pathMatch: 'full'
  },
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
    path: '**' , component : PageNotFoundComponent
  }
];


@NgModule({
  imports : [RouterModule.forRoot(appRoutes)],
  exports : [RouterModule]
})

export class AppRoutingModule{}
