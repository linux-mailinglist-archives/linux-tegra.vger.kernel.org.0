Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC961AE688
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 22:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730714AbgDQULL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 16:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730573AbgDQULK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 16:11:10 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367B5C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 13:11:10 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q22so3372049ljg.0
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 13:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RVG2bKmbZ4y9wY5cq2XdNLer07BD29fUHuKQ45NDSP0=;
        b=S/zofisQw2cmUFHpL7bYDOmobITWYxKGamznmFa0uubA0LcW/U6BVDwgaVzg9yrt6y
         y3nUTBHDb0qYn8Gk9DxPea1JKpgsQ9vU8j1Owx8MFLSpjhAA2JO0GNZw1JmkTlB+vcN+
         GhL+sdBO02q4u1r8kOoFPG6PM0BLNG0PK2gONOe92zN3Y8MZKw2CEz/GHSmoYWEXX1Tv
         H2rcyV4Sf6QKx+P8cqJfeVNfc6RPL/J8Jo1uazsuchCAwWyJyXnycANw2+Kv11BjaobM
         Vt1HnIkRz0s/+8YV/BXigazViRgOHwbVmCqb1oDckvEmi3vMtdiGYDRlvYDdMOo04AB9
         LPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RVG2bKmbZ4y9wY5cq2XdNLer07BD29fUHuKQ45NDSP0=;
        b=Nk8HhD14xwIB5pXp7uO7YArhiY5uFZBQAphRRVV2XjnZnUtpc0Eof1eYbsqYTQHVgB
         0JV34RgrTcufJCorAGL1OdXdXuYuyVwl0JE0F1WR3FihIvH0RVzyHEp5DAoYUlcv1FXP
         AMzJHIh+RvO3tdCOhgiayP1unn/XxCkXzDJkUDFynFOvDWYeOjpM9yCSX21u8Fz+z4rb
         aVc0NAXoJSVczk8MDiTEtzS969hAKfZ/LTKqahQmWK3549spbC66gOTWJa3n9toS4+zN
         1yrbNACK4o+l/Sgo8xqNFaqBLHyJ7Njcl+cNrazIz9a81dzwFoExO6ruwoc2tmIcVHVM
         udGQ==
X-Gm-Message-State: AGi0PuZ9Dqx/v+E0kXMyRr60ueSEKXS6dZzkkk/6tNGQM9HbtV6lyAXk
        jilZHThzC+NkiXFRymoiOJrEteGg
X-Google-Smtp-Source: APiQypL4LNbI4XRYGODAnuFJGu0VoHlcf0AIln/JkBVq4xUbETkYhCEa4zCxa6ssSicKvX1V1GpZLw==
X-Received: by 2002:a05:651c:39b:: with SMTP id e27mr3323167ljp.45.1587154268305;
        Fri, 17 Apr 2020 13:11:08 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id z15sm15881502ljk.99.2020.04.17.13.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 13:11:07 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] drm/tegra: output: rgb: Support LVDS encoder
 bridge
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-4-digetx@gmail.com>
 <20200417192453.GH5861@pendragon.ideasonboard.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <598c81ef-ba22-a832-0822-e08023f3dff6@gmail.com>
Date:   Fri, 17 Apr 2020 23:11:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417192453.GH5861@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.04.2020 22:24, Laurent Pinchart пишет:
...
> As I tried to explain before, if you wrap the panel in a bridge with
> drm_panel_bridge_add() (or the devm_ variant), you will always have a
> bridge associated with the output, and will be able to remove your
> custom connector implementation. I thus recommend converting to
> drm_panel_bridge_add() either as part of this patch series, or just
> after it, to get full benefits.
> 
> With the assumption that this will be handled,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks you very much!

Yes, I got yours point about wrapping panel into the bridge. But I don't
think that it's worth the effort right now because each Tegra output has
it's own implantation of the connector and it should be cleaner not to
touch that code.

Secondly, I don't have hardware to test all available panel output types
on Tegra and the benefits of messing with all that code are a bit dim to me.

I can make a patch to wrap the RGB panel into a bridge, but this should
make code a bit inconsistent in regards to not having a common code path
for the "legacy" nvidia,panel. So perhaps it's better to leave it all
as-is for now.
