package org.noe.eseiza.domains



import org.junit.*
import grails.test.mixin.*

@TestFor(CondicionController)
@Mock(Condicion)
class CondicionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/condicion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.condicionInstanceList.size() == 0
        assert model.condicionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.condicionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.condicionInstance != null
        assert view == '/condicion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/condicion/show/1'
        assert controller.flash.message != null
        assert Condicion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/condicion/list'

        populateValidParams(params)
        def condicion = new Condicion(params)

        assert condicion.save() != null

        params.id = condicion.id

        def model = controller.show()

        assert model.condicionInstance == condicion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/condicion/list'

        populateValidParams(params)
        def condicion = new Condicion(params)

        assert condicion.save() != null

        params.id = condicion.id

        def model = controller.edit()

        assert model.condicionInstance == condicion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/condicion/list'

        response.reset()

        populateValidParams(params)
        def condicion = new Condicion(params)

        assert condicion.save() != null

        // test invalid parameters in update
        params.id = condicion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/condicion/edit"
        assert model.condicionInstance != null

        condicion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/condicion/show/$condicion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        condicion.clearErrors()

        populateValidParams(params)
        params.id = condicion.id
        params.version = -1
        controller.update()

        assert view == "/condicion/edit"
        assert model.condicionInstance != null
        assert model.condicionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/condicion/list'

        response.reset()

        populateValidParams(params)
        def condicion = new Condicion(params)

        assert condicion.save() != null
        assert Condicion.count() == 1

        params.id = condicion.id

        controller.delete()

        assert Condicion.count() == 0
        assert Condicion.get(condicion.id) == null
        assert response.redirectedUrl == '/condicion/list'
    }
}
