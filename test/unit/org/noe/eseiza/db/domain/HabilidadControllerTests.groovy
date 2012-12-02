package org.noe.eseiza.db.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(HabilidadController)
@Mock(Habilidad)
class HabilidadControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/habilidad/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.habilidadInstanceList.size() == 0
        assert model.habilidadInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.habilidadInstance != null
    }

    void testSave() {
        controller.save()

        assert model.habilidadInstance != null
        assert view == '/habilidad/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/habilidad/show/1'
        assert controller.flash.message != null
        assert Habilidad.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/habilidad/list'

        populateValidParams(params)
        def habilidad = new Habilidad(params)

        assert habilidad.save() != null

        params.id = habilidad.id

        def model = controller.show()

        assert model.habilidadInstance == habilidad
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/habilidad/list'

        populateValidParams(params)
        def habilidad = new Habilidad(params)

        assert habilidad.save() != null

        params.id = habilidad.id

        def model = controller.edit()

        assert model.habilidadInstance == habilidad
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/habilidad/list'

        response.reset()

        populateValidParams(params)
        def habilidad = new Habilidad(params)

        assert habilidad.save() != null

        // test invalid parameters in update
        params.id = habilidad.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/habilidad/edit"
        assert model.habilidadInstance != null

        habilidad.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/habilidad/show/$habilidad.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        habilidad.clearErrors()

        populateValidParams(params)
        params.id = habilidad.id
        params.version = -1
        controller.update()

        assert view == "/habilidad/edit"
        assert model.habilidadInstance != null
        assert model.habilidadInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/habilidad/list'

        response.reset()

        populateValidParams(params)
        def habilidad = new Habilidad(params)

        assert habilidad.save() != null
        assert Habilidad.count() == 1

        params.id = habilidad.id

        controller.delete()

        assert Habilidad.count() == 0
        assert Habilidad.get(habilidad.id) == null
        assert response.redirectedUrl == '/habilidad/list'
    }
}
