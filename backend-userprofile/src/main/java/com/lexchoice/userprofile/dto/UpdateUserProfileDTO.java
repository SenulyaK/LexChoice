package com.lexchoice.userprofile.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UpdateUserProfileDTO {
    private String name;
    private String email;
    private String profilePicture;
    private Boolean notificationEnabled;
    private String language;
    private String password; // Optional field
}

