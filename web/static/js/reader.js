"use strict"

import Vue from "vue"
import VueResource from "vue-resource"
import {ClientTable, Event} from "vue-tables-2"
import moment from "moment"

Vue.use(VueResource)
Vue.use(ClientTable)


const table = {
  tableColumns: [
    "last", "first", "middle", "pet", "birthday", "color"
  ],
  tableOptions: {
    columnsClasses: { pet: "pet" },
    filterable: false,
    perPage: 100,
    rowClassCallback: (row) => ["person", row.pet.toLowerCase()],
    skin: "",
    sortIcon: {
      base: "",
      down: "active descending",
      up:   "active ascending"
    },
    texts: { noResults: "No records" }
  }
}


const reader = new Vue({
  el: "main",
  data: {
    filename: "",
    persons: [],
    ...table
  },
  http: {
    root: "/root",
    emulateJSON: true
  },
  filters: {
    downcase: (value) => {
      if (!value) return ""
      return value.toString().toLowerCase()
    }
  },
  methods: {
    changeFile: (e) => {
      this.$http.post("/api/upload", this.getFormData(e)).then(this.updateData)
    },

    getFormData: (e) => {
      let file = e.target.files[0]
      let data = new FormData()
      data.append("file", file, file.name)

      return data
    },

    updateData: (response) => {
      this.filename = response.body.filename
      this.persons = response.body.persons
      this.persons.forEach( function (person) {
        person["birthday"] = moment(person["birthday"])
      })
    },
  },
})

export {reader}
