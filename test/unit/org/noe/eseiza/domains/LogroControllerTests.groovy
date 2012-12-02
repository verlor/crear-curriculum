package org.noe.eseiza.domains



import org.junit.*
import grails.test.mixin.*

@TestFor(LogroController)
@Mock(Logro)
class LogroControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/logro/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.logroInstanceList.size() == 0
        assert model.logroInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.logroInstance != null
    }

    void testSave() {
        controller.save()

        assert model.logroInstance != null
        assert view == '/logro/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/logro/show/1'
        assert controller.flash.message != null
        assert Logro.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/logro/list'

        populateValidParams(params)
        def logro = new Logro(params)

        assert logro.save() != null

        params.id = logro.id

        def model = controller.show()

        assert model.logroInstance == logro
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/logro/list'

        populateValidParams(params)
        def logro = new Logro(params)

        assert logro.save() != null

        params.id = logro.id

        def model = controller.edit()

        assert model.logroInstance == logro
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/logro/list'

        response.reset()

        populateValidParams(params)
        def logro = new Logro(params)

        assert logro.save() != null

        // test invalid parameters in update
        params.id = logro.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/logro/edit"
        assert model.logroInstance != null

        logro.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/logro/show/$logro.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        logro.clearErrors()

        populateValidParams(params)
        params.id = logro.id
        params.version = -1
        controller.update()

        assert view == "/logro/edit"
        assert model.logroInstance != null
        assert model.logroInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/logro/list'

        response.reset()

        populateValidParams(params)
        def logro = new Logro(params)

        assert logro.save() != null
        assert Logro.count() == 1

        params.id = logro.id

        controller.delete()

        assert Logro.count() == 0
        assert Logro.get(logro.id) == null
        assert response.redirectedUrl == '/logro/list'
    }
}
