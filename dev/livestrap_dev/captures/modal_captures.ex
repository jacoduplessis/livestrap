defmodule LivestrapDev.Captures.ModalCaptures do
  use Phoenix.Component
  use LivestrapDev.LiveCapture

  alias Livestrap.Components.Modal
  alias Livestrap.Components.Button

  capture()

  def modal(assigns) do
    ~H"""
    <Button.bs_button variant="primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
      Launch modal
    </Button.bs_button>
    <Modal.bs_modal id="exampleModal" title="Modal title">
      Modal body content goes here.
      <:footer>
        <Button.bs_button variant="secondary" data-bs-dismiss="modal">Close</Button.bs_button>
        <Button.bs_button variant="primary">Save changes</Button.bs_button>
      </:footer>
    </Modal.bs_modal>
    """
  end

  capture()

  def modal_centered(assigns) do
    ~H"""
    <Button.bs_button variant="primary" data-bs-toggle="modal" data-bs-target="#centeredModal">
      Centered modal
    </Button.bs_button>
    <Modal.bs_modal id="centeredModal" title="Centered Modal" centered>
      This modal is vertically centered.
      <:footer>
        <Button.bs_button variant="secondary" data-bs-dismiss="modal">Close</Button.bs_button>
      </:footer>
    </Modal.bs_modal>
    """
  end

  capture()

  def modal_sizes(assigns) do
    ~H"""
    <Button.bs_button variant="primary" data-bs-toggle="modal" data-bs-target="#smallModal">
      Small modal
    </Button.bs_button>
    <Button.bs_button variant="primary" data-bs-toggle="modal" data-bs-target="#largeModal">
      Large modal
    </Button.bs_button>
    <Modal.bs_modal id="smallModal" title="Small Modal" size="sm">
      Small modal content.
    </Modal.bs_modal>
    <Modal.bs_modal id="largeModal" title="Large Modal" size="lg">
      Large modal content.
    </Modal.bs_modal>
    """
  end

  capture()

  def modal_static_backdrop(assigns) do
    ~H"""
    <Button.bs_button variant="primary" data-bs-toggle="modal" data-bs-target="#staticModal">
      Static backdrop
    </Button.bs_button>
    <Modal.bs_modal id="staticModal" title="Static Backdrop" static_backdrop>
      Clicking outside won't close this modal.
      <:footer>
        <Button.bs_button variant="secondary" data-bs-dismiss="modal">Close</Button.bs_button>
      </:footer>
    </Modal.bs_modal>
    """
  end
end
