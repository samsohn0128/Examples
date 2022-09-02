package com.studyolle.main;

import com.studyolle.account.CurrentUser;
import com.studyolle.domain.Account;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j
public class MainController {

    @GetMapping("/")
    public String home(@CurrentUser Account account, Model model) {
        log.info("MainController - home()");
        if (account != null) {
            log.info("account is not null : {}", account);
            log.info("account nickname : {}", account.getNickname());
            log.info("account emailCheckToken : {}", account.getEmailCheckToken());
            log.info("account isEmailVerified : {}", account.isEmailVerified());
            log.info("account joinedAt : {}", account.getJoinedAt());
            model.addAttribute(account);
        } else {
            log.info("account is null");
        }
        return "index";
    }
}
