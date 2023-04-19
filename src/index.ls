module.exports =
  pkg: dependencies: [ { name: "proxise" }, { name: "@plotdb/form" } ]
  interface: -> @widget
  init: ({root, data, ctx, pubsub, i18n}) ->
    {form} = ctx
    if root => root.style.display = "none!important"
    mod =
      init: ->
      render: ->
      is-empty: -> !v
      is-equal: (u, v) -> JSON.stringify(u) == JSON.stringify(v)
      validate: -> return true
    @widget = new form.widget({root, mod})
    <~ @widget.init!then _
    @widget.deserialize(data or {}, {init: true})
    @widget
