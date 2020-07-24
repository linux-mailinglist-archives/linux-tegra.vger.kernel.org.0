Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6447822C979
	for <lists+linux-tegra@lfdr.de>; Fri, 24 Jul 2020 17:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgGXPvy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 24 Jul 2020 11:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGXPvx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jul 2020 11:51:53 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C179CC0619D3
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2020 08:51:53 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t6so4672549plo.3
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2020 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1caOJyn2zbLAKcDiu3mrOFQu1qs9jpF03W2/Gj2Y0nI=;
        b=K6C0N2vE8/nn7p2q2KtKMz4OGJeY8xB215pP67IUgbKWw4ZWU/wIItq4bZ0qrOKUhy
         ARfmjTOLjpwtc7KTry9dGBYVrziGLKIWeXZ6s3jCmiWW3/ZQy0ZwwWzFjUrRn71q3FiI
         KFlKwTEkTWm8i5pw4wT1Jzh3ZYcRJYbGxgUcMIkkrXditdR+ie0ifKOUG9LhDi+sjEwo
         XQNoBF/En013xj2zxy53nMb3JhYIMAW2hxrEiCsSYagD5rCKgnqXRYWpL14H4A613ehz
         HP6kNqcRkgAXQ3bm6lsT40JeHCOa3JPZy1IWyUpOwRFfkSylYwhNcnM+Nn7t1rELsUWR
         +mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1caOJyn2zbLAKcDiu3mrOFQu1qs9jpF03W2/Gj2Y0nI=;
        b=uHAWArDrNMT/ccOzv4ZcUuj1/GIeta2bbKa9dPraGCbInIZN2CiDXwu7Us47QEjM+L
         nSbFiFPQyXr3c6lZKj2XUX+iYPoqiv9HLrPU7PhiIAT7pyME76yxCU7UIAALV+iINhhp
         gBFrynPiLLJaXq37oBmhlijk6aJWJvQt5q52zcDLUREe/bp4xUyOE7E6a4cLH/9zDOFn
         iYaCfXSzDqbwPUl1gP03N0UI7aJUS7qSAAY5ZajIloHi88pO88PSWp1Ikh02lyYL3ILh
         3Dm+p1HPj24SqJ7N5dWTHW7aotICGrEHK/+ge0gkZLf01WFyhV8H1DChTOsMP7SnA0De
         tF0g==
X-Gm-Message-State: AOAM532cHftPNhWaMkNvrtZUrKTHIgQVFso+m/vV7fFtkR6w2wyvpTkh
        4IrQPTmWgxBTcE7RGYcufO4=
X-Google-Smtp-Source: ABdhPJz1C47dmE8pVOeUs51Q1QxcGxetVALh7VcI/sk2mkXGP7D9s1AmUNdmdY71LKXDpS7+HL7vmQ==
X-Received: by 2002:a17:902:7787:: with SMTP id o7mr8838621pll.327.1595605913215;
        Fri, 24 Jul 2020 08:51:53 -0700 (PDT)
Received: from [192.168.0.109] ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id n63sm6786713pfd.209.2020.07.24.08.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 08:51:52 -0700 (PDT)
Subject: Re: [PATCH v3] staging: nvec: change usage of slave to secondary
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     marvin24@gmx.de, gregkh@linuxfoundation.org,
        p.zabel@pengutronix.de, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, ac100@lists.launchpad.net
References: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
 <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
 <20200724140947.GW2549@kadam>
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Message-ID: <79c59734-d4ed-7968-5c9d-17d0ffe37b73@gmail.com>
Date:   Fri, 24 Jul 2020 21:21:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724140947.GW2549@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/07/20 7:39 pm, Dan Carpenter wrote:
> On Fri, Jul 24, 2020 at 10:06:34AM +0530, Rohit K Bharadwaj wrote:
>> @@ -784,7 +784,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
>>  	platform_set_drvdata(pdev, nvec);
>>  	nvec->dev = dev;
>>  
>> -	if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr)) {
>> +	if (of_property_read_u32(dev->of_node, "secondary-addr", &nvec->i2c_addr)) {
> 
> Sorry, I should have looked for v3 at the start to reply to it.  This
> line will break the driver.
> 
> regards,
> dan carpenter
> 

Thank you for your review sir, my intention was to fix kernel coding style issues and hence had picked this one. 
Could you please let me know whether I should undo that particular line and submit the patch again so as not to break the driver? 
