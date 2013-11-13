define = require('amdefine')(module)  if typeof define isnt 'function'
define [
  './_misc'
  'stream'
], (
  {_}
  {Transform}
) ->
  "use strict"

  class Message extends Transform
    _rawLine: undefined
    _rawHeaders: undefined
    _socket: undefined
    _transaction: undefined
    protocol: 'HTTP'
    version: '1.1'
    headers: undefined
    representation: undefined


    constructor: ({socket, transaction}) ->
      super()
      @_socket = socket
      @_transaction = transaction
      @headers = {}


    destroy: (error) ->
      @_socket?.destroy error


    getHeader: (name) ->
      name = name.toLowerCase()
      @headers[name]
