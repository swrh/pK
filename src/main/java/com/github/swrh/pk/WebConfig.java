package com.github.swrh.pk;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        final String viewName = "forward:/";

        // Map "/word", "/word/word", and "/word/word/word" - except for anything starting with "/api/..." or ending with
        // a file extension like ".js" - to index.html. By doing this, the client receives and routes the url. It also
        // allows client-side URLs to be bookmarked.

        // Single directory level - no need to exclude "api"
        registry.addViewController("/{x:\\w+}").setViewName(viewName);
        // Multi-level directory path, need to exclude "api" on the first part of the path
        registry.addViewController("/{x:^(?!api$).*$}/**/{y:\\w+}").setViewName(viewName);
    }
}
