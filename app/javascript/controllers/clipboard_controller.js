import { Controller } from "@hotwired/stimulus";
import Clipboard from "clipboard";

export default class extends Controller {
  static values = {
    successMessage: { type: String, default: "Copied!" },
    errorMessage: { type: String, default: "Failed!" },
  }

  connect() {
    this.clipboard = new Clipboard(this.element);
    this.clipboard.on("success", (event) => this.tooltip(this.successMessageValue));
    this.clipboard.on("error", (event) => this.tooltip(this.errorMessageValue));
  }

  tooltip(message) {
    tippy(this.element, {
      content: message,
      showOnCreate: true,
      onHidden: (instance) => {
        instance.destroy();
      }
    })
  }

  disconnect() {
    this.clipboard.destroy();
  }
}
