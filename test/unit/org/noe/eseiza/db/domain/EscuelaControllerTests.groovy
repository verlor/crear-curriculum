package org.noe.eseiza.db.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(EscuelaController)
@Mock(Escuela)
class EscuelaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/escuela/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.escuelaInstanceList.size() == 0
        assert model.escuelaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.escuelaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.escuelaInstance != null
        assert view == '/escuela/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/escuela/show/1'
        assert controller.flash.message != null
        assert Escuela.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/escuela/list'

        populateValidParams(params)
        def escuela = new Escuela(params)

        assert escuela.save() != null

        params.id = escuela.id

        def model = controller.show()

        assert model.escuelaInstance == escuela
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/escuela/list'

        populateValidParams(params)
        def escuela = new Escuela(params)

        assert escuela.save() != null

        params.id = escuela.id

        def model = controller.edit()

        assert model.escuelaInstance == escuela
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/escuela/list'

        response.reset()

        populateValidParams(params)
        def escuela = new Escuela(params)

        assert escuela.save() != null

        // test invalid parameters in update
        params.id = escuela.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/escuela/edit"
        assert model.escuelaInstance != null

        escuela.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/escuela/show/$escuela.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        escuela.clearErrors()

        populateValidParams(params)
        params.id = escuela.id
        params.version = -1
        controller.update()

        assert view == "/escuela/edit"
        assert model.escuelaInstance != null
        assert model.escuelaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/escuela/list'

        response.reset()

        populateValidParams(params)
        def escuela = new Escuela(params)

        assert escuela.save() != null
        assert Escuela.count() == 1

        params.id = escuela.id

        controller.delete()

        assert Escuela.count() == 0
        assert Escuela.get(escuela.id) == null
        assert response.redirectedUrl == '/escuela/list'
    }
}
