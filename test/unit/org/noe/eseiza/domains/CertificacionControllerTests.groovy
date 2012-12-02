package org.noe.eseiza.domains



import org.junit.*
import grails.test.mixin.*

@TestFor(CertificacionController)
@Mock(Certificacion)
class CertificacionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/certificacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.certificacionInstanceList.size() == 0
        assert model.certificacionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.certificacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.certificacionInstance != null
        assert view == '/certificacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/certificacion/show/1'
        assert controller.flash.message != null
        assert Certificacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/certificacion/list'

        populateValidParams(params)
        def certificacion = new Certificacion(params)

        assert certificacion.save() != null

        params.id = certificacion.id

        def model = controller.show()

        assert model.certificacionInstance == certificacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/certificacion/list'

        populateValidParams(params)
        def certificacion = new Certificacion(params)

        assert certificacion.save() != null

        params.id = certificacion.id

        def model = controller.edit()

        assert model.certificacionInstance == certificacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/certificacion/list'

        response.reset()

        populateValidParams(params)
        def certificacion = new Certificacion(params)

        assert certificacion.save() != null

        // test invalid parameters in update
        params.id = certificacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/certificacion/edit"
        assert model.certificacionInstance != null

        certificacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/certificacion/show/$certificacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        certificacion.clearErrors()

        populateValidParams(params)
        params.id = certificacion.id
        params.version = -1
        controller.update()

        assert view == "/certificacion/edit"
        assert model.certificacionInstance != null
        assert model.certificacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/certificacion/list'

        response.reset()

        populateValidParams(params)
        def certificacion = new Certificacion(params)

        assert certificacion.save() != null
        assert Certificacion.count() == 1

        params.id = certificacion.id

        controller.delete()

        assert Certificacion.count() == 0
        assert Certificacion.get(certificacion.id) == null
        assert response.redirectedUrl == '/certificacion/list'
    }
}
