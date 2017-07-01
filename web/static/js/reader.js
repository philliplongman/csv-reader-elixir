"use strict"

import Vue from "vue"
import VueResource from "vue-resource"
// import {ClientTable, Event} from "vue-tables-2"
import moment from "moment"

Vue.use(VueResource)
// Vue.use(ClientTable)


let tableOptions = {
  columns: [
    "last_name", "first_name", "middle_initial", "pet", "birthday", "color"
  ],
  options: {
    columnsClasses: { pet: "pet" },
    filterable: false,
    perPage: 100,
    rowClassCallback: row => { return row.pet.toLowerCase() },
    skin: "",
    sortIcon: {
      base: "",
      down: "active descending",
      up:   "active ascending"
    },
    texts: { noResults: "No records" }
  }
}


let reader = new Vue({
  el: "main",
  data: {
    filename: "",
    persons: [],
    tableColumns: tableOptions["columns"],
    tableOptions: tableOptions["options"]
  },
  http: {
    root: "/root",
    emulateJSON: true
  },
  filters: {
    downcase: function (value) {
      if (!value) return ""
      return value.toString().toLowerCase()
    }
  },
  methods: {

    changeFile: function (e) {
      this.$http.post("/", this.getFormData(e)).then(this.updateData)
    },

    getFormData: function (e) {
      let file = e.target.files[0]
      let data = new FormData()
      data.append("file", file, file.name)

      return data
    },

    updateData: function (response) {
      this.filename = response.body.filename
      this.persons = response.body.people
      this.persons.forEach( function (person) {
        person["birthday"] = moment(person["birthday"])
      })
    },
  },
})

export {reader}
