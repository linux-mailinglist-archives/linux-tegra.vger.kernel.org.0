Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E6CD0AC4
	for <lists+linux-tegra@lfdr.de>; Wed,  9 Oct 2019 11:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfJIJQj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 9 Oct 2019 05:16:39 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46586 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfJIJQj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Oct 2019 05:16:39 -0400
Received: by mail-lj1-f196.google.com with SMTP id d1so1660434ljl.13
        for <linux-tegra@vger.kernel.org>; Wed, 09 Oct 2019 02:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2dX1j5FmngTuB/YA+W8U2XDPRFBtzqFWZPBKLZrONRU=;
        b=hfXoBK72qBw5UC+B/gUBFD/RW+KmrCblDwrBaWTu5n7ru6AmGB/uUmJzXjARnn6Jo0
         omsVs+OUDVhC+I3iEZ05GpijfsxtNby9QyNI0nkiZ2sDv/q/ND3SJbmo5x4OtShJTYXJ
         t61nO+tAK1pCmLpKKElim2Q3NiJv5muJFs0A0J7UuyDOLVvGl1MW2587HleIFs276VsH
         VXGc3qTXpd+dIlv6yJgHozkNtis6UXHApwpvMrbTVp5G12vxt/AL3NA0RZYy4SLFd2kT
         iUg5fXQ7P96SUtQWSICAUNcoJxm+zcO+VXKY330ds56hpM2CPjQ56Vz8UXMBhP1njQcp
         s/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2dX1j5FmngTuB/YA+W8U2XDPRFBtzqFWZPBKLZrONRU=;
        b=Aqzv6FE1OPYrAAg0/KkNmaqr4DW9jDIt2DLF0RbHfCPNIhZig6Vm0oIUuYVQg7CD29
         mSAkEugQ8pbz+DxD6eH1xuJYN4ES569ThGb/mmo5KPKES4O2qdsv0Ke1XTjFb3/xO+KN
         Vui2djnaRJ0OWipZ8d3au114X449xgaaq0UKSp7c3Af2yypQ5zUtp1ngO2Of+k6lAtyo
         IX6t/LAz2vPjrmeTaRypnDthpcR037zEMg85EH9CwgUt5iX5M1os5z1lypBOBzbu6LVF
         oaAyXPH/BBb87suYmq+IHtYy3tAvexaseogSxuXR09OLxilAyD71LSOcUb2uvY3amoxl
         lF6A==
X-Gm-Message-State: APjAAAXRXE4pM2M5u1mu733Tcqyk5cEEjWJZawOY/CU/jidFxz8FG+y9
        c7ckxKmJcaw5M8fvsZt34vlGNV5o
X-Google-Smtp-Source: APXvYqymKQKUof0k2nFCbeHMDaAR0AIO7ijnOtqTHJYZXZFQ7DxzaeX5a9sN9qWnb8iPVZp1f1NSMg==
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr1610244ljj.43.1570612597410;
        Wed, 09 Oct 2019 02:16:37 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.231])
        by smtp.googlemail.com with ESMTPSA id f28sm336343lfp.28.2019.10.09.02.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 02:16:36 -0700 (PDT)
Subject: Re: [RFC] [PATCH 0/5] enable tegra-udc host mode
To:     Peter Chen <peter.chen@nxp.com>, Peter Geis <pgwipeout@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20191002014153.29831-1-pgwipeout@gmail.com>
 <20191008062523.GC5670@b29397-desktop>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b9f3e295-761a-ed40-75c5-5d8ad69b16a2@gmail.com>
Date:   Wed, 9 Oct 2019 12:16:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191008062523.GC5670@b29397-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

08.10.2019 09:25, Peter Chen пишет:
> On 19-10-01 21:41:48, Peter Geis wrote:
>> This patch set enables the tegra-udc driver to take the place of
>> tegra-ehci as the usb host driver.
>> It fixes up some checks in the tegra-udc driver.
>> It pulls the tegra specific bits from the tegra-ehci driver.
>>
>> It would be better to have generic helpers in the dma core that can
>> handle alignment, instead of using tegra specific helpers, but that is
>> well above my skillset.
>>
>> I haven't checked OTG functionality, mostly because I don't have any
>> devices with working OTG yet.
> 
> I am not sure what the OTG mean here, the OTG Compliance (OTG FSM in
> code) are almost dead, so you don't need to consider support it.
> Usually, people considers dual-role switch as OTG.

Yes, I assume we're talking about the dual-role switch.
