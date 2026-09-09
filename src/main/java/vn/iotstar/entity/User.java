package vn.iotstar.entity;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
@Table(name = "[User]")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    @Column(
            name = "email",
            nullable = false,
            unique = true
    )
    private String email;


    @Column(
            name = "username",
            nullable = false,
            unique = true
    )
    private String username;


    @Column(name = "fullname")
    private String fullname;


    @Column(
            name = "password",
            nullable = false
    )
    private String password;


    @Column(name = "avatar")
    private String avatar;


    @Column(name = "roleid")
    private Integer roleid;


    @Column(name = "phone")
    private String phone;


    @Column(name = "createdDate")
    private Date createdDate;


    @Column(name = "active")
    private Boolean active;


    public User() {
    }


    @PrePersist
    public void prePersist() {

        if (createdDate == null) {

            createdDate =
                    new Date(
                            System.currentTimeMillis()
                    );
        }

        if (roleid == null) {
            roleid = 2;
        }

        if (active == null) {
            active = true;
        }
    }


    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }


    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email = email;
    }


    public String getUsername() {
        return username;
    }


    public void setUsername(String username) {
        this.username = username;
    }


    public String getFullname() {
        return fullname;
    }


    public void setFullname(String fullname) {
        this.fullname = fullname;
    }


    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password;
    }


    public String getAvatar() {
        return avatar;
    }


    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }


    public Integer getRoleid() {
        return roleid;
    }


    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }


    public String getPhone() {
        return phone;
    }


    public void setPhone(String phone) {
        this.phone = phone;
    }


    public Date getCreatedDate() {
        return createdDate;
    }


    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }


    public Boolean getActive() {
        return active;
    }


    public void setActive(Boolean active) {
        this.active = active;
    }
}