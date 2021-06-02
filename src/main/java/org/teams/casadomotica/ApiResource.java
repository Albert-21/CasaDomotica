/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teams.casadomotica;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author alberto
 */
public class ApiResource {

    private final ClientApi service;
    private final List<Alarma> listaAlarmas;
    private final List<Dispositivo> listaDispositivos;

    public ApiResource() {
        this.service = new ClientApi();
        this.listaAlarmas = new ArrayList<>();
        this.listaDispositivos = new ArrayList<>();
    }

    public boolean guardarUsuario(Usuario usuario) {
        boolean ressultado = false;
        try {
            JSONObject json = new JSONObject(usuario);
            service.PostNewUser(json.toString());
            ressultado = true;
            return ressultado;
        } catch (Exception ex) {
            Logger.getLogger(ApiResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ressultado;
    }

    public Usuario login(Usuario usuario) {
        Usuario user = null;
        try {
            JSONObject json = new JSONObject(usuario);
            JSONObject jsonTmp = new JSONObject(service.PostLogin(json.toString()));
            user = new Usuario();
            user.setUsuario(jsonTmp.getString("usuario"));
            user.setContrasena(jsonTmp.getString("contrasena"));
            return user;
        } catch (Exception ex) {
            Logger.getLogger(ApiResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public boolean guardarDispositivo(Dispositivo dispositivo) {
        boolean ressultado = false;
        try {
            JSONObject json = new JSONObject(dispositivo);
            service.PostNewDispositivo(json.toString());
            ressultado = true;
            return ressultado;
        } catch (Exception ex) {
            Logger.getLogger(ApiResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ressultado;
    }

    public boolean borrarDispositivo(String id) {
        boolean ressultado = false;
        try {
            service.DeleteDispositivo(id);
            ressultado = true;
            return ressultado;
        } catch (Exception ex) {
            Logger.getLogger(ApiResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ressultado;
    }

    public boolean actualizarEstadoDispositivo(Dispositivo dispositivo) {
        boolean ressultado = false;
        try {
            JSONObject json = new JSONObject(dispositivo);
            service.PutEstadoDispositivo(json.toString());
            ressultado = true;
            return ressultado;
        } catch (Exception ex) {
            Logger.getLogger(ApiResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ressultado;
    }

    public Dispositivo mostrarEstadoDispositivo(String id) {
        Dispositivo dispositivo = null;
        try {

            JSONObject json = new JSONObject(service.GetEstadoDispositivo(id));
            dispositivo = new Dispositivo();
            dispositivo.setId(id);
            dispositivo.setNombre(json.getString("estado"));
            return dispositivo;
        } catch (Exception ex) {
            Logger.getLogger(ApiResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dispositivo;
    }

    public List<Dispositivo> mostrarDispositivos() {
        listaDispositivos.clear();
        try {
            JSONArray jsonArray = new JSONArray(service.GetDispositivos());
            for (int i = 0; i < jsonArray.length(); i++) {
                listaDispositivos.add(new Dispositivo(jsonArray.getJSONObject(i).getString("id"), jsonArray.getJSONObject(i).getString("nombre"), jsonArray.getJSONObject(i).getString("estado"), jsonArray.getJSONObject(i).getString("descripcion"), jsonArray.getJSONObject(i).getString("tipo"), jsonArray.getJSONObject(i).getString("usuario")));
            }
        } catch (Exception ex) {
            Logger.getLogger(ApiResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaDispositivos;
    }

    public List<Dispositivo> mostrarCortinas() {
        listaDispositivos.clear();
        try {
            JSONArray jsonArray = new JSONArray(service.GetCortinas());
            for (int i = 0; i < jsonArray.length(); i++) {
                listaDispositivos.add(new Dispositivo(jsonArray.getJSONObject(i).getString("id"), jsonArray.getJSONObject(i).getString("nombre"), jsonArray.getJSONObject(i).getString("estado"), jsonArray.getJSONObject(i).getString("descripcion"), jsonArray.getJSONObject(i).getString("tipo"), jsonArray.getJSONObject(i).getString("usuario")));
            }
        } catch (Exception ex) {
            Logger.getLogger(ApiResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaDispositivos;
    }

    public List<Dispositivo> mostrarFocos() {
        listaDispositivos.clear();
        try {
            JSONArray jsonArray = new JSONArray(service.GetFocos());
            for (int i = 0; i < jsonArray.length(); i++) {
                listaDispositivos.add(new Dispositivo(jsonArray.getJSONObject(i).getString("id"), jsonArray.getJSONObject(i).getString("nombre"), jsonArray.getJSONObject(i).getString("estado"), jsonArray.getJSONObject(i).getString("descripcion"), jsonArray.getJSONObject(i).getString("tipo"), jsonArray.getJSONObject(i).getString("usuario")));
            }
        } catch (Exception ex) {
            Logger.getLogger(ApiResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaDispositivos;
    }

    public boolean guardarAlarma(Alarma alarma) {
        boolean ressultado = false;
        try {
            JSONObject json = new JSONObject(alarma);
            service.PostNewAlarma(json.toString());
            ressultado = true;
            return ressultado;
        } catch (Exception ex) {
            Logger.getLogger(ApiResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ressultado;
    }

    public boolean borrarAlarma(String id) {
        boolean ressultado = false;
        try {
            service.DeleteAlarma(id);
            ressultado = true;
            return ressultado;
        } catch (Exception ex) {
            Logger.getLogger(ApiResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ressultado;
    }

    public boolean actualizarAlarma(Alarma alarma) {
        boolean ressultado = false;
        try {
            JSONObject json = new JSONObject(alarma);
            service.PutCambioAlarma(json.toString());
            ressultado = true;
            return ressultado;
        } catch (Exception ex) {
            Logger.getLogger(ApiResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ressultado;
    }

    public List<Alarma> mostrarAlarmas() {
        listaAlarmas.clear();
        try {
            JSONArray jsonArray = new JSONArray(service.GetAlarmas());
            for (int i = 0; i < jsonArray.length(); i++) {
                listaAlarmas.add(new Alarma(jsonArray.getJSONObject(i).getString("id_alarma"), jsonArray.getJSONObject(i).getString("nombre"), jsonArray.getJSONObject(i).getString("estado"), jsonArray.getJSONObject(i).getString("hora_inicio"), jsonArray.getJSONObject(i).getString("hora_fin"), jsonArray.getJSONObject(i).getString("descripcion"), jsonArray.getJSONObject(i).getString("fecha_inicio"), jsonArray.getJSONObject(i).getString("fecha_fin"), jsonArray.getJSONObject(i).getString("id_dispositivo")));
            }
        } catch (Exception ex) {
            Logger.getLogger(ApiResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaAlarmas;
    }

}
