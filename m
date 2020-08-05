Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7795723D058
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Aug 2020 21:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgHEQ7W (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Aug 2020 12:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728338AbgHEQ4b (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Aug 2020 12:56:31 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6361AC06138E;
        Wed,  5 Aug 2020 09:47:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id i10so13701615ljn.2;
        Wed, 05 Aug 2020 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jkOdBdO08EcdjYNQvO6hnKQ7g8Bc3xOIvWMLuyvy5vA=;
        b=htbIgM+VsC4cNSRq7tGLBRyqjtHiPvTmTR/c9jJqrTUIGns5efKfFOyvdqVQis08Nf
         MAxixMW4yT64TM8zUrkfg7lr7Flo+2N6oJ8mZF2SRPDna/pnl1WKeluYOGze94SLRNuU
         52n8xP99cI/MUHiyub/sY+2safSk2+sc22P0KhJF0KvW0j8S6+hq5Jk57jF6SavUrMsg
         tKIRcmP4UiIJ48J9Gbzq8a0iEnZ6bv+5UhusUDCiDmjmjN9/n1Ze84cMUmw3UxqRHRz8
         luqZsrk/5EDDxaSwBc+FFIUwbD91Kpu0YE7/S2Pim9sUlZyGQhuecU9RW6rdoo5O5aH9
         qfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jkOdBdO08EcdjYNQvO6hnKQ7g8Bc3xOIvWMLuyvy5vA=;
        b=HxsEM3lNTwdJMIhqFM/+uqG+Biessn6rtR/ccSeaiBBtNTKrP3os8Tk1lWLzuh9rBH
         l/7C8EJk3245m/cBh6nZyt57y0hNTsWwqGHwvY6FEqYnif2IKmlU2LQqxCoHe1qlYHxO
         lDpAtF+Pe9y+4uY0mFIuQCsJDqWfRd4tC5PUj416KtUSaq8UtN5FqxEDBfNsPnWA4pRa
         /wKNQM+7zdU77i+0c/Eh+NT2LsttLqRPzmlAAY25JvmqOj7IUixogtp/2/xcjMzts2D8
         lc8XCI75w3PXcdB6XZ/alvQKayLluIL0k8q44tvV4HvtK3hVnwrJN4QagFjlccP0j0T+
         uDYg==
X-Gm-Message-State: AOAM532TcQgBwagWJdx2iW0CqVcMMwJ0e5GpZSJyofTr7cwAyjFewhBV
        AClHIQWSw6SwhJYMwiiPYVzMhVuq
X-Google-Smtp-Source: ABdhPJz+wm2diUC/Yki4O/lySEHvpWaqyFiuJofLGCzO5ByOTvAiWxyGNmHmtvVOsOoK2X9E673njw==
X-Received: by 2002:a2e:9d1a:: with SMTP id t26mr974947lji.297.1596646059174;
        Wed, 05 Aug 2020 09:47:39 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id i20sm1173416ljb.90.2020.08.05.09.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 09:47:38 -0700 (PDT)
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <1596469346-937-9-git-send-email-skomatineni@nvidia.com>
 <20200805134600.GA3351349@ulmo>
 <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
 <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
 <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ed80bf2f-213f-286a-59b2-fc85e4181b3d@gmail.com>
Date:   Wed, 5 Aug 2020 19:47:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.08.2020 19:33, Sowjanya Komatineni пишет:
> 
> On 8/5/20 7:19 AM, Dmitry Osipenko wrote:
>> 05.08.2020 17:05, Dmitry Osipenko пишет:
>>> 05.08.2020 16:46, Thierry Reding пишет:
>>>> On Mon, Aug 03, 2020 at 08:42:24AM -0700, Sowjanya Komatineni wrote:
>>>>> With the split of MIPI calibration into tegra_mipi_calibrate() and
>>>>> tegra_mipi_wait(), MIPI clock is not kept enabled till the calibration
>>>>> is done.
>>>>>
>>>>> So, this patch skips disabling MIPI clock after triggering start of
>>>>> calibration and disables it only after waiting for done status from
>>>>> the calibration logic.
>>>>>
>>>>> This patch renames tegra_mipi_calibrate() as
>>>>> tegra_mipi_start_calibration()
>>>>> and tegra_mipi_wait() as tegra_mipi_finish_calibration() to be inline
>>>>> with their usage.
>>>>>
>>>>> As MIPI clock is left enabled and in case of any failures with CSI
>>>>> input
>>>>> streaming tegra_mipi_finish_calibration() will not get invoked.
>>>>> So added new API tegra_mipi_cancel_calibration() which disables
>>>>> MIPI clock
>>>>> and consumer drivers can call this in such cases.
>>>>>
>>>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>   drivers/gpu/drm/tegra/dsi.c |  4 ++--
>>>>>   drivers/gpu/host1x/mipi.c   | 19 ++++++++++---------
>>>>>   include/linux/host1x.h      |  5 +++--
>>>>>   3 files changed, 15 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
>>>>> index 3820e8d..a7864e9 100644
>>>>> --- a/drivers/gpu/drm/tegra/dsi.c
>>>>> +++ b/drivers/gpu/drm/tegra/dsi.c
>>>>> @@ -694,11 +694,11 @@ static int tegra_dsi_pad_calibrate(struct
>>>>> tegra_dsi *dsi)
>>>>>           DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
>>>>>       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
>>>>>   -    err = tegra_mipi_calibrate(dsi->mipi);
>>>>> +    err = tegra_mipi_start_calibration(dsi->mipi);
>>>>>       if (err < 0)
>>>>>           return err;
>>>>>   -    return tegra_mipi_wait(dsi->mipi);
>>>>> +    return tegra_mipi_finish_calibration(dsi->mipi);
>>>>>   }
>>>>>     static void tegra_dsi_set_timeout(struct tegra_dsi *dsi,
>>>>> unsigned long bclk,
>>>>> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
>>>>> index e606464..b15ab6e 100644
>>>>> --- a/drivers/gpu/host1x/mipi.c
>>>>> +++ b/drivers/gpu/host1x/mipi.c
>>>>> @@ -293,17 +293,19 @@ int tegra_mipi_disable(struct
>>>>> tegra_mipi_device *dev)
>>>>>   }
>>>>>   EXPORT_SYMBOL(tegra_mipi_disable);
>>>>>   -int tegra_mipi_wait(struct tegra_mipi_device *device)
>>>>> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device)
>>>>> +{
>>>>> +    clk_disable(device->mipi->clk);
>>>> Do we need to do anything with the MIPI_CAL_CTRL and MIPI_CAL_STATUS
>>>> registers here? We don't clear the START bit in the former when the
>>>> calibration has successfully finished, but I suspect that's because
>>>> the bit is self-clearing. But I wonder if we still need to clear it
>>>> upon cancellation to make sure the calibration does indeed stop.
>>> Apparently there is no way to explicitly stop calibration other than to
>>> reset MIPI calibration block, but Sowjanya says this is unnecessary.
>>>
>>> Perhaps having a fixed delay before disabling clock could be enough to
>>> ensure that calibration is stopped before the clock is disabled?
>>>
>> Actually, there is a MIPI_CAL_ACTIVE bit in the status register. Maybe
>> it needs to be polled until it's unset?
> 
> Confirmed with HW design team during this patch update.
> 
> SW does not need to clear START bit and only write 1 takes effect to
> that bit.
> 
> Also, no need to have delay or do any other register settings unclear as
> its FSM and there's nothing to get stuck.
> 
> Also it goes thru small finite set of codes and by the time sensor
> programming happens for enabling streaming FSM will finish its
> calibration sequence much early and it will only wait for pads LP-11.
> 
> So, during cancel we only need disable MIPI clock.
> 

But there is no guarantee that cancel_calibration() couldn't be invoked
in the middle of the calibration process, hence FSM could freeze in an
intermediate state if it's running on the disabled MIPI clock, this
doesn't sound good.
