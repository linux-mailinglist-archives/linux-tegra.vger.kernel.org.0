Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66CD81AD105
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 22:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgDPUVp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 16:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727967AbgDPUVo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 16:21:44 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78242C061A0C
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 13:21:44 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id v9so9223799ljk.12
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 13:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Toe9EFNHVHf4euVV41c+6ZKdGRmphziwECd1HLN5bj4=;
        b=mp5QjqeXEpzz/RC5864mh4AGvSyk/YJUHBwd8EWL4iUI0WXJUJYYAMWFSnaGjqY8un
         jPNtEMDugufQKUhBS2tU08lsUH5i4vY9DskaTzQGGSkm2Q7zgVfUxiyG13OV86oNJ5oJ
         MneJa5vNL1WtdeQDBn0ZUIsakrJZsNms4JOrcXGjIs36exmCiDc2chUiXBLKvTD+sbix
         yF534TfyCCLwDSFdRBYJrGpesrswqDrO1KOpS3ev7iE966bSLRZBpWCR93HdpMOLVwTH
         BKVnY1WiwYV7htqOa2w/A69S7mNDpCicsLz5oj0LZNKDSKDR6ER4+GH6kzko2zmNuQzD
         ZuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Toe9EFNHVHf4euVV41c+6ZKdGRmphziwECd1HLN5bj4=;
        b=siJg2fEpaYvKT6AulP6A/eNJXjxSKddE5DEeiinbYLTz8paCfG24pC46zYwPW8vgtL
         cC1xTa5KXAEqoZZXl0goKIz7BW3+RE5Kz9EK0wk1T+6jjc1iTPQexmyZYkop9zJV/VXh
         cTlR4V4fI5GYq48DUTPT18vr8lo+ZrhD+rAdYGClxYvun/hG7FufvmdmduFKQktH7eYQ
         5eaVUGpqoo231m/dx71VI8t1jlM5RnPmzhwEcmXRAYqDBVaiUCh0Y1pEsT7ZAirjRKX2
         WT5MXVXiWBnmW+sCGjJmHwiC+sco3heewygoAd3wt9rA0IkyT7TL7yudFuV5grVGKJ0c
         YoRA==
X-Gm-Message-State: AGi0PuYq+hixUj1ox2gnlvLJ2sO25FwZZm4K1rvBPpQImUxV1XEynDg3
        1lKNb6C7U3gYfMiD0KyWgTk19/uP
X-Google-Smtp-Source: APiQypK9kdZSj1RLjRCfDhqZhxNr3HSkOJSkYEgiA0qwvIDJP5PyK2JI/rWYfPIScCP+cnZWmhS6KQ==
X-Received: by 2002:a2e:8290:: with SMTP id y16mr7587501ljg.186.1587068502429;
        Thu, 16 Apr 2020 13:21:42 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id q26sm5684757ljg.47.2020.04.16.13.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 13:21:41 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder
 bridge
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
 <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
Message-ID: <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
Date:   Thu, 16 Apr 2020 23:21:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.04.2020 21:52, Dmitry Osipenko пишет:
...
>> May I also recommend switching to the DRM panel bridge helper ? It will
>> simplify the code.
> 
> Could you please clarify what is the "DRM panel bridge helper"?
> 
> I think we won't need any additional helpers after switching to the
> bridge connector helper, no?

Actually, I now see that the panel needs to be manually attached to the
connector.

Still it's not apparent to me how to get panel out of the bridge. It
looks like there is no such "panel helper" for the bridge API or I just
can't find it.
