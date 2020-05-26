Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C35421C7761
	for <lists+linux-tegra@lfdr.de>; Wed,  6 May 2020 19:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgEFRFb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 6 May 2020 13:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729414AbgEFRFb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 6 May 2020 13:05:31 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E2FC061A0F;
        Wed,  6 May 2020 10:05:30 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f11so3206517ljp.1;
        Wed, 06 May 2020 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i6DgO5+TRdDJq45v1B/zETVA5zYOWCANdfi6IDZAE08=;
        b=nJ/sVN4kSr6t9IdoSsZPyyOmbUtLWQu7s5b311BEDJvl06V1lFO2Wk5poGrlIbZsWG
         G8EybU7nSnwfFfkbvCXPrcZUZQIqm16wZ+rPp0O3hQE0JEcsYsFTb3O3J/N12j9y2gzY
         RBKwbVGcFBA26M8N0u/dDpO8IVTP26eaMkcKJ0052VehWgaqhfAqoGIcUzS/bm+YkiGh
         Ky74G8aJ+0xjJNlTypLKNlTCx+b/tYENL6cUTpTDZwR/eERinbs/nmOg/5KfmgeHFH8G
         DQemBq3wpqRb34Ade7odH7pdEztMk6j5BPSz1mhgc2rrp7b5WDgNZtw5mGMw6mWcU5J2
         Vzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i6DgO5+TRdDJq45v1B/zETVA5zYOWCANdfi6IDZAE08=;
        b=X/DJ7g8LVCJd9Mwys2iRezV9obV/srv9ag8+BsKWBCQ1c0MvG/9ou3Gm0YYFWDUShY
         tvOzxj1Gm1U3URAnukF+bFuWqE6qYdwV0xnuOnH4/KfXstGMWaXd0740ajC41xLhNOoc
         V1WdeBKgyzR14OeHpwYkl43vCTSl5/8Wf+XISW3nCl9JiQPgKuhQ1tw5adl3DUki6Suw
         8QTVfpCM+yAOF6K6iN5hlXcWA1pFmDBWj3ZdfvNdEfRPmKwIDOiEggduIbs6BdmwErlU
         Fshge/A99aQifaAsHxAFCPGB3p2V+NJ1LEaZDdkoPUt/3NZ+6MkN33yku5cUjD39CmId
         PKsQ==
X-Gm-Message-State: AGi0PuaNgC34bypz34amyowUGNL1187KFnR0e/KNZR15JGCFA5R4BA+8
        vSlykkGs70s0mVuUGf3m0CA3doJg
X-Google-Smtp-Source: APiQypKTUTxtYqnFPuX+HwJKBbGWBlPEj9Ko1LNSd7vmorqXwvlYb84XnkdhwewUOEpEiJLOYMc43Q==
X-Received: by 2002:a2e:80c1:: with SMTP id r1mr5389478ljg.227.1588784729261;
        Wed, 06 May 2020 10:05:29 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id d9sm1971851lfa.77.2020.05.06.10.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 10:05:28 -0700 (PDT)
Subject: Re: [PATCH v5 2/6] drm/of: Make drm_of_find_panel_or_bridge() to
 check graph's presence
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200418170703.1583-1-digetx@gmail.com>
 <20200418170703.1583-3-digetx@gmail.com>
 <20200506164133.GB19296@ravnborg.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f288e704-2fdb-d548-9f5b-8016412dfd3f@gmail.com>
Date:   Wed, 6 May 2020 20:05:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506164133.GB19296@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

06.05.2020 19:41, Sam Ravnborg пишет:
> On Sat, Apr 18, 2020 at 08:06:59PM +0300, Dmitry Osipenko wrote:
>> When graph isn't defined in a device-tree, the of_graph_get_remote_node()
>> prints a noisy error message, telling that port node is not found. This is
>> undesirable behaviour in our case because absence of a panel/bridge graph
>> is a valid case. Let's check presence of the local port in a device-tree
>> before proceeding with parsing the graph.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thank you again for taking a look at these patches!
