package org.noe.eseiza.db.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(NacionalidadController)
@Mock(Nacionalidad)
class NacionalidadControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/nacionalidad/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.nacionalidadInstanceList.size() == 0
        assert model.nacionalidadInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.nacionalidadInstance != null
    }

    void testSave() {
        controller.save()

        assert model.nacionalidadInstance != null
        assert view == '/nacionalidad/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/nacionalidad/show/1'
        assert controller.flash.message != null
        assert Nacionalidad.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/nacionalidad/list'

        populateValidParams(params)
        def nacionalidad = new Nacionalidad(params)

        assert nacionalidad.save() != null

        params.id = nacionalidad.id

        def model = controller.show()

        assert model.nacionalidadInstance == nacionalidad
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/nacionalidad/list'

        populateValidParams(params)
        def nacionalidad = new Nacionalidad(params)

        assert nacionalidad.save() != null

        params.id = nacionalidad.id

        def model = controller.edit()

        assert model.nacionalidadInstance == nacionalidad
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/nacionalidad/list'

        response.reset()

        populateValidParams(params)
        def nacionalidad = new Nacionalidad(params)

        assert nacionalidad.save() != null

        // test invalid parameters in update
        params.id = nacionalidad.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/nacionalidad/edit"
        assert model.nacionalidadInstance != null

        nacionalidad.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/nacionalidad/show/$nacionalidad.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        nacionalidad.clearErrors()

        populateValidParams(params)
        params.id = nacionalidad.id
        params.version = -1
        controller.update()

        assert view == "/nacionalidad/edit"
        assert model.nacionalidadInstance != null
        assert model.nacionalidadInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/nacionalidad/list'

        response.reset()

        populateValidParams(params)
        def nacionalidad = new Nacionalidad(params)

        assert nacionalidad.save() != null
        assert Nacionalidad.count() == 1

        params.id = nacionalidad.id

        controller.delete()

        assert Nacionalidad.count() == 0
        assert Nacionalidad.get(nacionalidad.id) == null
        assert response.redirectedUrl == '/nacionalidad/list'
    }
}
