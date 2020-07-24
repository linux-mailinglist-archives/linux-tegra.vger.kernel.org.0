Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F46D22BD36
	for <lists+linux-tegra@lfdr.de>; Fri, 24 Jul 2020 06:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgGXEzh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 24 Jul 2020 00:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgGXEzg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jul 2020 00:55:36 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A973C0619D3
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2020 21:55:36 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z3so4418812pfn.12
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2020 21:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KUGNez/yWopa8M4UAQie5p0SRU+rtQXbmfcJhAwjSGM=;
        b=CEaUzU2EjHIwmifpoC8w8OUjKejbZpPX8tEpSvaNf4GlZg5HvvwFlKZPKCWmM5MW9d
         A7gWfHbBmuvVFEVf1o46MyUDuFit7u171Ix8YkMpP36Y2YpAk80OADX2LmGRxWEDegUk
         pud5poFOjlIA3ZpMviJZVvgQ9Nt6/3I5dvdhJgPHWFgyu5u0HCSOuLe/4J2O+yHva/p1
         CdPJQBBvagjM7kvZsaAmNBek+hrDjEZgvBHhZNZT/CtEugT2+bK+Y9wcmO9F5QeXdARG
         l8SXXNEVrJnq2E6C5HKm7rNUN8Shn9X/+m/yibD/XUt1BLF4rmAZ8xJ0V2ZFnQUjs14J
         wb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KUGNez/yWopa8M4UAQie5p0SRU+rtQXbmfcJhAwjSGM=;
        b=riwTaceo2ycLl2Q4Z4Vxp3uY/oDadJEZLpDGW3T+ly7LLGfIlzDLOtoM2fkFhgipvK
         cHNWIktJld/QPzCNXTbTGQkQFvP/PsX2T1X6+iqYSK9UiyGN5/L3oaqDKIvWgwDniE5Z
         fWqdO4J9cvYOAbettq1n1e4Q3gi/IXaq4SNNcj2YvjhFyn8Dzre48xFq6jsUfaVbId0B
         YafSPs5HGZ6ULOIms1o/ssRi+o1/jz4O+jSffrjdQ56vktsfYj+zDmzOMNWsDzL3tDXU
         7e87u0xidEVvcD24OUzKMuRuwP/kho1lD0uC4TTvJiGxnYa4+BqvUsMY0ckCsRJMncL4
         S4MA==
X-Gm-Message-State: AOAM532kFDWuJjIv4gniWWwY2PjiFyHyfa0lIgBlt/DSizCMtarcnTIz
        xc+5gVqJjp2dAmxnKMB3i00=
X-Google-Smtp-Source: ABdhPJzSb6kQbM7nhLKTe82S3NZF7tl8KSfjJbnc9LBLAHDV5k1rjkBvaow9A+Vrbbjb0BJA5xubeA==
X-Received: by 2002:a62:be06:: with SMTP id l6mr7415859pff.310.1595566536039;
        Thu, 23 Jul 2020 21:55:36 -0700 (PDT)
Received: from [192.168.0.109] ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id z2sm4602328pfq.67.2020.07.23.21.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 21:55:35 -0700 (PDT)
Subject: Re: [PATCH] change slave occurence to secondary everywhere
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     marvin24@gmx.de, p.zabel@pengutronix.de,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        ac100@lists.launchpad.net
References: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
 <20200723170618.GA2835510@kroah.com>
From:   Rohit Bharadwaj <bharadwaj.rohit8@gmail.com>
Message-ID: <d666ee4f-fe5a-e41e-0c67-6c29be14a048@gmail.com>
Date:   Fri, 24 Jul 2020 10:25:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723170618.GA2835510@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 23/07/20 10:36 pm, Greg KH wrote:
> On Thu, Jul 23, 2020 at 08:45:13PM +0530, Rohit K Bharadwaj wrote:
>> changed usage of slave (deprecated) to secondary
>>
>> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
>> ---
>>  drivers/staging/nvec/nvec.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> Odd subject line, you should follow the other patches for this driver:
> 	staging: nvec: one_line_description_here
> 
> Also, you need to version your patches, this was v2, right?  Put below
> the --- line what you changed for each version.
> 
> v3?
> 
> thanks,
> 
> greg k-h
> 

Thank you so much for the suggestions sir, I have made all the necessary changes and have submitted the patch again, I apologize for any inconvenience caused from my side.
