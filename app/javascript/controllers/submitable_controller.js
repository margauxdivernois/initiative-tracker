// Source: Cours de MAS-RAD
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  submit(event) {
    this.element.requestSubmit();
  }
}
