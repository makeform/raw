module.exports =
  pkg: dependencies: [ { name: "proxise" }, { name: "@plotdb/form" } ]
  interface: -> @widget
  init: ({root, data, ctx, pubsub, i18n}) ->
    {form} = ctx
    if root => root.style.display = "none!important"
    (opt = {}) <~ pubsub.on \init, _
    @widget = new form.widget({root} <<< opt)
    <~ @widget.init!then _
    @widget.deserialize(data or {}, {init: true})
    @widget
