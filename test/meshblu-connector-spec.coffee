Serial = require '../'

xdescribe 'Serial', ->
  beforeEach ->
    @sut = new Serial

  describe '->start', ->
    it 'should be a method', ->
      expect(@sut.start).to.be.a 'function'

    describe 'when called with a device', ->
      it 'should not throw an error', ->
        expect(=> @sut.start({ uuid: 'hello' })).to.not.throw(Error)

  describe '->isOnline', ->
    it 'should be a method', ->
      expect(@sut.isOnline).to.be.a 'function'

    it 'should yield running false', (done) ->
      @sut.isOnline (error, response) =>
        return done error if error?
        expect(response.running).to.be.false
        done()

    it 'should yield running false when client', (done) ->
      @sut.client = true
      @sut.isOnline (error, response) =>
        return done error if error?
        expect(response.running).to.be.true
        done()

  describe '->close', ->
    it 'should be a method', ->
      expect(@sut.close).to.be.a 'function'

    it 'should yield when called', (done) ->
      @sut.close => done()

  describe '->onMessage', ->
    it 'should be a method', ->
      expect(@sut.onMessage).to.be.a 'function'

    describe 'when called with a message', ->
      it 'should not throw an error', ->
        expect(=> @sut.onMessage({ topic: 'hello', devices: ['123'] })).to.not.throw(Error)

  describe '->onConfig', ->
    it 'should be a method', ->
      expect(@sut.onConfig).to.be.a 'function'

    describe 'when called with a config', ->
      it 'should not throw an error', ->
        expect(=> @sut.onConfig { type: 'hello' }).to.not.throw(Error)
