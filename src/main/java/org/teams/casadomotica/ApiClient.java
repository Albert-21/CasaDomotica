/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teams.casadomotica;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;

/**
 * Jersey REST client generated for REST resource:CasadomoResource
 * [casadomo]<br>
 * USAGE:
 * <pre>
 *        ApiClient client = new ApiClient();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author alberto
 */
public class ApiClient {

    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8080/APICasaD/webresources";

    public ApiClient() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("casadomo");
    }

    public <T> T postDispositivo(Object requestEntity, Class<T> responseType) throws ClientErrorException {
        return webTarget.path("newdispositivo").request(javax.ws.rs.core.MediaType.APPLICATION_JSON).post(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON), responseType);
    }

    public <T> T postAlarma(Object requestEntity, Class<T> responseType) throws ClientErrorException {
        return webTarget.path("newalarma").request(javax.ws.rs.core.MediaType.APPLICATION_JSON).post(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON), responseType);
    }

    public <T> T putEstado(Object requestEntity, Class<T> responseType) throws ClientErrorException {
        return webTarget.path("cambioestado").request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON), responseType);
    }

    public <T> T postUsuario(Object requestEntity, Class<T> responseType) throws ClientErrorException {
        return webTarget.path("newuser").request(javax.ws.rs.core.MediaType.APPLICATION_JSON).post(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON), responseType);
    }

    public String getEstado(String id) throws ClientErrorException {
        WebTarget resource = webTarget;
        if (id != null) {
            resource = resource.queryParam("id", id);
        }
        resource = resource.path("consultarestado");
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class);
    }

    public void deleteAlarma(String id) throws ClientErrorException {
        WebTarget resource = webTarget;
        if (id != null) {
            resource = resource.queryParam("id", id);
        }
        resource = resource.path("deletealarma");
        resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).delete(String.class);
    }

    public <T> T putAlarma(Object requestEntity, Class<T> responseType) throws ClientErrorException {
        return webTarget.path("cambioalarma").request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON), responseType);
    }

    public <T> T getUsuario(Object requestEntity, Class<T> responseType) throws ClientErrorException {
        return webTarget.path("login").request(javax.ws.rs.core.MediaType.APPLICATION_JSON).post(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON), responseType);
    }

    public <T> T getDispositivos(Class<T> responseType) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path("alarmas");
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void deleteDispositivo(String id) throws ClientErrorException {
        WebTarget resource = webTarget;
        if (id != null) {
            resource = resource.queryParam("id", id);
        }
        resource = resource.path("deletedispositivo");
        resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).delete(String.class);
    }

    public void close() {
        client.close();
    }

}
