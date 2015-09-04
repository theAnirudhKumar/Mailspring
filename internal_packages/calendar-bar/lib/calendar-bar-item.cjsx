React = require 'react'
{Actions} = require("nylas-exports")
moment = require 'moment'

# TODO: This file is out of date!
return

class CalendarBarItem extends React.Component
  render: =>
    style =
      left: @props.item.xPercent
      top: @props.item.yPercent
      width: @props.item.wPercent
      height: @props.item.hPercent
      zIndex: @props.item.z
    <div className="event" style={style} id={@props.item.event.id}>
        <span className="title">{@props.item.event.title}</span>
        <span className="time">{@_time()}</span>
    </div>

  _time: =>
    w = @props.item.event.when
    if w.start_time
      return moment.unix(w.start_time).format('h:mm a')
    else if w.time
      return moment.unix(w.time).format('h:mm a')
    else if w.start_date
      return moment.unix(w.start_date).format('MMMM Do')
    else
      return ""

  _onClick: (event) =>
    event.preventDefault()
    Actions.focusMailView(@props.tag)


module.exports = CalendarBarItem
