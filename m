Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB8125E979
	for <lists+linux-tegra@lfdr.de>; Sat,  5 Sep 2020 19:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbgIERkF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 5 Sep 2020 13:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727875AbgIERkF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 5 Sep 2020 13:40:05 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F6BEC061244;
        Sat,  5 Sep 2020 10:40:04 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id w186so9460726qkd.1;
        Sat, 05 Sep 2020 10:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=FT2fvVKVJcJnfLDFKoXi+lvCScvW2jBOGcN2i14P3/w=;
        b=Lqo5n7TLIXEQT9AIIOV6WKKDMeUGoeymIrJPgzDqEihOzktfTzcXMnsRmVEYsWA2nx
         0x67Xb4gDgNUhUXll3kfmiH664UdPCJCOE3/Kvd2nf3jwQoUBu0IAuBcF834kTjOUera
         4X+XyenrjgprjwH3oMQw3Zrng+AV4CoGWYc7no8t2PCmSMi0frEJ0eIiYuNU8p4Dwi65
         T87P5wUrBoDf37JalrZl6IHhxwxrWzGrqlMyCp+8+Th2ZhLbV+lvRWSFI4hdyqszvKE8
         YzQEZQEkfb4XF7OOV/fPTnn1i/4ACEPDBHFrMAc4xKljsUOBQypQyc+YThs/USlZJiCS
         Teeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=FT2fvVKVJcJnfLDFKoXi+lvCScvW2jBOGcN2i14P3/w=;
        b=F8FEYyDMlDFc/jiTL2ehm5m41l+5xAg7eiHgrCjgqn1ILcZqDTQC202UPoQDWIIaqn
         xCEDCTLUBgnfbMyVzQSG1tPD0B8uYq8SLN/uzbra6I8ysewdiYaQE/M5blF4OAKKp7C2
         vrpfaamqZTQ2E3R3ZHifG4+dM/jnfXfy1YJHawrkAleciJ2x7js3OMYUbAPMXbORiIHP
         t1+9tEOD503QfIZskZga8BFmcYnW+u+thgOekdBSuaHHuUsMWQPygC2aywcF76E4+u0E
         2jCbH35sZ47fqXrzLP825bBKGoRTVa7jDzwz3KraG2VVjEIhkGxu9sAAtFS08Qi/U99t
         fH2Q==
X-Gm-Message-State: AOAM5316cGKgJtZJeNxsSD2xkCH8oGE0WtfgJ5z1HWEgL9kInBZ3rM8j
        z1iee12VdCptpheb4EVgMqyg4pu9pEWJRw==
X-Google-Smtp-Source: ABdhPJyYbr4n/cq8l1/LRCoE4oFaV5Fky5lEJ/Xnlo5eIuO5doXVJSqYvaY4d3wwM2J2vldeL9hF2g==
X-Received: by 2002:a37:9f4e:: with SMTP id i75mr12417322qke.180.1599327600705;
        Sat, 05 Sep 2020 10:40:00 -0700 (PDT)
Received: from ?IPv6:2800:270:c:c::1000? ([2800:270:c:c::1000])
        by smtp.gmail.com with ESMTPSA id z37sm7665883qtz.67.2020.09.05.10.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 10:40:00 -0700 (PDT)
To:     linux-tegra@vger.kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From:   =?UTF-8?B?TWF0w61hcyBaw7rDsWlnYQ==?= <matias.nicolas.zc@gmail.com>
Subject: [xhci-tegra] Kernel 5.7 regression - tegra124-nyan
Message-ID: <eb0e8cd1-8f6c-f1df-fe15-6e23572b7655@gmail.com>
Date:   Sat, 5 Sep 2020 13:39:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello!

Since kernel 5.7 (specifically commits 
f67213cee2b35fe169a723746b7f37debf20fa29) the xhci-tegra driver fails to 
initialize the USB ports of tegra124-nyan devices with the message 
"usb-role-switch not found for otg".

The named commit, which adds usb-role-switch support, effectively broke 
all device trees with "otg" or "peripheral" modes that do not include 
the "usb-role-switch" property.

Given that the otg port of nyan devices is just a type A connector, I 
can patch the device tree to use the "host" mode and it works fine, but 
since it seems to be an otg port internally, maybe it's better to add 
the usb-role-switch property with a "connector" subnode.
However, I don't know if other devices are affected, so I think the 
driver should be "fixed" to work again with DTs without usb-role-switch.

Cheers,
Matías Zúñiga

