Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458962244F5
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 22:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbgGQUNq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jul 2020 16:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727871AbgGQUNp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 16:13:45 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4633FC0619D2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 13:13:45 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s9so14026600ljm.11
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 13:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5fhjf/YnStcYM6LxBO8TgF0Hb1Sq+HPJU/Vb5xKn3RU=;
        b=mxTQ5J76AcJHnoF3Bb/ET/VqzJ6Hqq7faJVzbrhuyIO1In/9+qMSGDVWHciiBT9IV5
         M1ZGV+MTHovml8KNcuxkMC2A3oQPN9A+d4y5pVWuaWPzOrJJvjpZcksrTiQw6o1Z03Mi
         cRy+eNgel+lAL2COqfy+PCchVQvZQtYFXb+QvJnvFDOYTqeMJC0vrqb9HCvfzCGjin6z
         F2wgBafXB42ACCOmJgwCBVcMjelxzDkPDvlWntlLSATiT76Ndd+Cr3+u6DfaXx98lY3d
         vIpP53B6Oqs6r/7phB9cPgEXPjoqkRNfqNi2BMnRUOdLRLSSC+RpWuToKiAvTHpwUg2f
         qFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5fhjf/YnStcYM6LxBO8TgF0Hb1Sq+HPJU/Vb5xKn3RU=;
        b=Ns8Dpha2TEDIoIcSNo+th4T+arzSAVGWiIcAnaocAo2Ob68HFBgCUH6bIY2ats9wPq
         AsGrdRT/qZySS2Euat074Bh+xIPIthEXh36hixOBpwzffIKoTgY2iaVwBnhz2BBDC7Yk
         Wp9AYecWMUWIib6p0Ebnc6VI4bWR6Y3hlX/x8dXnW0xfrCtUZUBi1+NBIa4KdrBGv79Y
         cBMtme2Y+RWp9QvFcYozjRwT+WtROhjZ7mMFFcEoaDUJxisO/sPG6JcjRpE26DBooo0/
         alXlBZsOXzf3iIwLe8de7tLFQKz+yn8wxdZ46hELp1SzQOuYZkpN1x/OpZFw7Xf5sy3y
         gSww==
X-Gm-Message-State: AOAM530dajYEYGoCjoIpGjGRbOye2boCerrwbVF6P5eguqrvYArFp1Ns
        XNkCt7gvNkt6ZgOk2gqfcHk=
X-Google-Smtp-Source: ABdhPJwzX95J2EkbIGEwORANK1nl3fVzj9yjH1VgTwH+g7x0aRaAjL5rzDnl7fULyYdtOs6dpNzFaQ==
X-Received: by 2002:a2e:b889:: with SMTP id r9mr5310187ljp.92.1595016823662;
        Fri, 17 Jul 2020 13:13:43 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-4-184.pppoe.mtu-net.ru. [91.76.4.184])
        by smtp.googlemail.com with ESMTPSA id h21sm1817583ljk.31.2020.07.17.13.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 13:13:42 -0700 (PDT)
Subject: Re: [GIT PULL 6/7] ARM: tegra: Default configuration changes for
 v5.9-rc1
To:     Arnd Bergmann <arnd@arndb.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20200717161300.1661002-1-thierry.reding@gmail.com>
 <20200717161300.1661002-6-thierry.reding@gmail.com>
 <CAK8P3a1niUF7xK_bmz=8NJbRGxs7iFzNnRgRS9H=bXpMqarsWg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a6f83a03-3a8f-47d0-6770-fe0e2595cde5@gmail.com>
Date:   Fri, 17 Jul 2020 23:13:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1niUF7xK_bmz=8NJbRGxs7iFzNnRgRS9H=bXpMqarsWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.07.2020 22:24, Arnd Bergmann пишет:
> On Fri, Jul 17, 2020 at 6:13 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>> ARM: tegra: Default configuration changes for v5.9-rc1
>>
>> Enables a few new configuration options that are useful on the new Nexus
>> 7 and Acer A500 devices, as well as the userspace CPU frequency governor
>> that's mainly used for testing.
> 
> I've pulled all the other branches, but I'm a little bit wary about
> this one since
> Dmitry's patch enables a number of options that would increase the kernel
> size, and I see no indication that it has been reviewed by anyone else.
> 
> I think the changes all make sense, but I would prefer to have a wider
> audience for that patch and get some Acks. If you like, you can send the
> tegra specific changes in a new pull request in the meantime, and then
> send the remaining additions to the usual suspects as an RFC, with
> Cc:soc@kernel.org, so I can apply it later if everyone is happy enough
> with it.

Hello, Arnd!

But these are already the tegra specific changes. The patch changes
tegra_defconfig and not the multi_v7_defconfig.

Could you please clarify from whom would you expect to get more Acks if
not from the tegra maintainers?

In practice nobody uses upstream defconfig as-is, it's only used as
initial template. So I'm not sure why tegra-kernel size makes you to
worry. Could you please explain?
