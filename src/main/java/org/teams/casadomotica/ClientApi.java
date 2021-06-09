/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teams.casadomotica;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

/**
 *
 * @author alberto
 */
public class ClientApi {

    private String URl_BASE = "http://34.134.23.55:5026/APICasaD-1.0-SNAPSHOT/webresources/casadomo/";

    public void PostNewUser(String usuario) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpPost postRequest = new HttpPost(URl_BASE + "newuser");
            postRequest.addHeader("content-type", "application/json");
            StringEntity userEntity = new StringEntity(usuario);
            postRequest.setEntity(userEntity);
            HttpResponse response = httpClient.execute(postRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public String PostLogin(String usuario) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpPost postRequest = new HttpPost(URl_BASE + "login");
            postRequest.addHeader("content-type", "application/json");
            StringEntity userEntity = new StringEntity(usuario);
            postRequest.setEntity(userEntity);
            HttpResponse response = httpClient.execute(postRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }

            HttpEntity httpEntity = response.getEntity();
            String apiOutput = EntityUtils.toString(httpEntity);
            return apiOutput;
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public void PostNewDispositivo(String dispositivo) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpPost postRequest = new HttpPost(URl_BASE + "newdispositivo");
            postRequest.addHeader("content-type", "application/json");
            StringEntity userEntity = new StringEntity(dispositivo);
            postRequest.setEntity(userEntity);
            HttpResponse response = httpClient.execute(postRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public void DeleteDispositivo(String id) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpDelete deleteRequest = new HttpDelete(URl_BASE + "deletedispositivo" + id);
            HttpResponse response = httpClient.execute(deleteRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public void PutEstadoDispositivo(String dispositivo) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpPut putRequest = new HttpPut(URl_BASE + "cambioestado");
            putRequest.addHeader("content-type", "application/json");
            StringEntity userEntity = new StringEntity(dispositivo);
            putRequest.setEntity(userEntity);
            HttpResponse response = httpClient.execute(putRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public String GetEstadoDispositivo(String id) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpGet getRequest = new HttpGet(URl_BASE + "consultarestado" + id);
            HttpResponse response = httpClient.execute(getRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }

            HttpEntity httpEntity = response.getEntity();
            String apiOutput = EntityUtils.toString(httpEntity);
            return apiOutput;
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public String GetDispositivos() throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpGet getRequest = new HttpGet(URl_BASE + "dispositivos");
            HttpResponse response = httpClient.execute(getRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
            HttpEntity httpEntity = response.getEntity();
            String apiOutput = EntityUtils.toString(httpEntity);
            return apiOutput;
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public String GetFocos() throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpGet getRequest = new HttpGet(URl_BASE + "focos");
            HttpResponse response = httpClient.execute(getRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
            HttpEntity httpEntity = response.getEntity();
            String apiOutput = EntityUtils.toString(httpEntity);
            return apiOutput;
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public String GetCortinas() throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpGet getRequest = new HttpGet(URl_BASE + "cortinas");
            HttpResponse response = httpClient.execute(getRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
            HttpEntity httpEntity = response.getEntity();
            String apiOutput = EntityUtils.toString(httpEntity);
            return apiOutput;
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public void PostNewAlarma(String alarma) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpPost postRequest = new HttpPost(URl_BASE + "newalarma");
            postRequest.addHeader("content-type", "application/json");
            StringEntity userEntity = new StringEntity(alarma);
            postRequest.setEntity(userEntity);
            HttpResponse response = httpClient.execute(postRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public void DeleteAlarma(String id) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpDelete deleteRequest = new HttpDelete(URl_BASE + "deletealarma?id=" + id);
            HttpResponse response = httpClient.execute(deleteRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public void PutCambioAlarma(String alarma) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpPut putRequest = new HttpPut(URl_BASE + "cambioalarma");
            putRequest.addHeader("content-type", "application/json");
            StringEntity userEntity = new StringEntity(alarma);
            putRequest.setEntity(userEntity);
            HttpResponse response = httpClient.execute(putRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public String GetAlarmas(String user) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpGet getRequest = new HttpGet(URl_BASE + "alarmas?usuario=" + user);
            System.out.println(URl_BASE + "alarmas?usuario=" + user);
            HttpResponse response = httpClient.execute(getRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
            HttpEntity httpEntity = response.getEntity();
            String apiOutput = EntityUtils.toString(httpEntity);
            return apiOutput;
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public String GetAlarmasFocos(String user) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpGet getRequest = new HttpGet(URl_BASE + "alarmasfocos?usuario=" + user);
            System.out.println(URl_BASE + "alarmas?usuario=" + user);
            HttpResponse response = httpClient.execute(getRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
            HttpEntity httpEntity = response.getEntity();
            String apiOutput = EntityUtils.toString(httpEntity);
            return apiOutput;
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public String GetAlarmasCortinas(String user) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpGet getRequest = new HttpGet(URl_BASE + "alarmascortinas?usuario=" + user);
            System.out.println(URl_BASE + "alarmas?usuario=" + user);
            HttpResponse response = httpClient.execute(getRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
            HttpEntity httpEntity = response.getEntity();
            String apiOutput = EntityUtils.toString(httpEntity);
            return apiOutput;
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public String GetHumedad() throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpGet getRequest = new HttpGet(URl_BASE + "humedad");
            HttpResponse response = httpClient.execute(getRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
            HttpEntity httpEntity = response.getEntity();
            String apiOutput = EntityUtils.toString(httpEntity);
            return apiOutput;
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

    public String GetTemperatura() throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpGet getRequest = new HttpGet(URl_BASE + "temperatura");
            HttpResponse response = httpClient.execute(getRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + statusCode);
            }
            HttpEntity httpEntity = response.getEntity();
            String apiOutput = EntityUtils.toString(httpEntity);
            return apiOutput;
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
    }

}
