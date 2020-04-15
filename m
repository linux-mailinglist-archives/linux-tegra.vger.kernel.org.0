Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8852F1AACB6
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Apr 2020 18:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415126AbgDOQAg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 15 Apr 2020 12:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1415122AbgDOQAf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Apr 2020 12:00:35 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD189C061A0C
        for <linux-tegra@vger.kernel.org>; Wed, 15 Apr 2020 09:00:34 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x23so3062361lfq.1
        for <linux-tegra@vger.kernel.org>; Wed, 15 Apr 2020 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pUbXwRuaBoeeQE8WpzdLHLKfjXnzTNrUyV5shPciAfo=;
        b=rAYOMusK1gE96A1cVRlpvyzFLG/+DX/S9afSbxyyfHizRSp4AD3hiDWvquAIr4uWI3
         BKia5hOnMIUMogDbgYCo4N3QDs2Mcu2NIFY9fz1xoR1Na1XPORTEbhfY7c7jGNv8XZFM
         n9SvnsRcPyA0blvDbniWGSsxitW7qSBNQqibeEOpISz6d3lfFCq9MOgFmDt0gxoBAXCz
         oskR8E6C1Cq/mzTjYbKR6VM5bm/fFrJOTYQi9qtMoVrDCu4Xu02otFeKYkkJqEXjEq0O
         iUWXOfv89OfnSBGA5Ax2yrkwSk5aFeQAzpnDcW4wHrfhR0Oi2qRApKVSJGs+S0bRVfid
         LUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pUbXwRuaBoeeQE8WpzdLHLKfjXnzTNrUyV5shPciAfo=;
        b=na4PQePhZSnoHj3iJxKmCug81Esi5YgJSRPkUEB5B5jNY/a/E2IJCCYKBcxvdTBCH4
         F0VyXZwKNK4pjbzi28TE1LLnvmFYZwzNeCdaaDey9vHbx8NRMwviwp1XtlaiUmnEFKiF
         GO5IK1x9QZ4iLtMxY31FApXnuodYyUCdxajR0XL8OdQEA3EFo67WmKTa5sN+OfJmGWdu
         0D2LEhIXupjpcxN7bQhoPz5zA2RD1XgUw6NU28jFbcfnjpXe+Or+Vn4yzP0YKOIoMnxw
         EYv+zxiCIcNPxJUTVPkmtlbxWFccTNTGK7V5msIPT1OuuSic10TtssEG81LcmpK7GxLx
         PRpA==
X-Gm-Message-State: AGi0PuYM6oPsEL1ce/v/vnOtrjpZcBcezLnwikgZDDPT0OSXIv4lkhBn
        w3S4qO86nl/pzaS4txcta7w=
X-Google-Smtp-Source: APiQypLSdWzn+mFcTNZ2SOmdhlYs8nrXyYbXhqvfgxKsQ3txqbvOZtrUk9TYSHZOJ2kvS94Ef1/Q4w==
X-Received: by 2002:a05:6512:308e:: with SMTP id z14mr3510912lfd.110.1586966432969;
        Wed, 15 Apr 2020 09:00:32 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id x67sm13060263lfa.76.2020.04.15.09.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 09:00:32 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Support DRM bridges on NVIDIA Tegra
To:     Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200414222007.31306-1-digetx@gmail.com>
 <20200415095324.GB30444@ravnborg.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c7567d52-4d42-4e70-4cc5-92311c53da04@gmail.com>
Date:   Wed, 15 Apr 2020 19:00:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415095324.GB30444@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.04.2020 12:53, Sam Ravnborg пишет:
> Hi Dimitry.
> 
> Added Laurent that is the arthitecht behind the new bridge model
> briefly explained below.
> 
> On Wed, Apr 15, 2020 at 01:20:05AM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This small series adds initial support for the DRM bridges to NVIDIA Tegra
>> DRM driver. This is required by newer device-trees where we model the LVDS
>> encoder bridge properly.
>>
>> Please note that the first "Support DRM bridges" patch was previously sent
>> out as a standalone v1 change.
>>
>> Changelog:
>>
>> v2: - Added the new "rgb: Don't register connector if bridge is used"
>>       patch, which hides the unused connector provided by the Tegra DRM
>>       driver when bridge is used, since bridge provides its own connector
>>       to us.
> 
> We are moving to a model where the display driver have the
> responsibility to create the connector - not the bridge.
> 
> The flags argument to:
> 
>     drm_bridge_attach(encoder, bridge, previous, flags);
> 
> is used to tell if the brigde shall create the connector or the display
> driver does it - DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> 
> It would be preferred that we moved the relevant bridge drivers to the
> new model no so you did not need to support the old model in the driver.

Hello Sam,

Thank you very much for the clarification! To be honest, I was a bit
confused by the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

Perhaps would be nice if the code told explicitly that drivers should
use the new flag because it appeared to me that adding bridge functions
to the DRM driver is a step backwards since looks like it involves
writing some more code :)

> If you help identify the bridge drivers we could migrate them to the new
> model and you could help testing?
> 
> What bridge drivers will be used for tegra?

It's lvds-encoder of bridge/lvds-codec.c, which supports the new model.

I'll try to move to the new model in v3. Thanks again!
