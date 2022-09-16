LinkAlternatifMimpishioView = require './link-alternatif-mimpishio-view'
{CompositeDisposable} = require 'atom'

module.exports = LinkAlternatifMimpishio =
  linkAlternatifMimpishioView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @linkAlternatifMimpishioView = new LinkAlternatifMimpishioView(state.linkAlternatifMimpishioViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @linkAlternatifMimpishioView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'link-alternatif-mimpishio:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @linkAlternatifMimpishioView.destroy()

  serialize: ->
    linkAlternatifMimpishioViewState: @linkAlternatifMimpishioView.serialize()

  toggle: ->
    console.log 'LinkAlternatifMimpishio was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
