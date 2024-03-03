import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    content: String,
  };

  copy(event) {
    event.preventDefault();
    navigator.clipboard
      .writeText(this.contentValue)
      .then(() => this.copied(event.srcElement));
  }

  copied(element) {
    // Be careful with innerHTML usage, might be necessary to validate the original innerHTML.
    let originalText = element.innerHTML;
    element.innerHTML =
      '<i class="iconoir-clipboard-check me-1"></i> Lien copié avec succès';

    // Set back the original content
    setTimeout(() => (element.innerHTML = originalText), 1000);
  }
}
