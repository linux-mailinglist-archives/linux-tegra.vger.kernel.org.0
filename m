Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055FE209725
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jun 2020 01:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389074AbgFXXXT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 24 Jun 2020 19:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389016AbgFXXXS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Jun 2020 19:23:18 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1540C061797
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 16:23:17 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id n23so4448774ljh.7
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 16:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+q5Opz1z0wRg1NqzZx58OYZGGiibmuJzUjuRhMUUaD4=;
        b=P9h8YJipfoA4gOUtNAyLZS5oT+vkZhgxQkidgXELT5luS7daPypiQjcoJOzIn8LdK/
         90CYU23yVp+6f8ZKMnl3TVcs/JLWXpwepm6xPv0Fc75KgyekbskgdoHnKd8WbjwSy736
         yt9V0qQGKBC4QXD11c8RaV9wjUID7StbeBpK2YvFT211LymuNnlxj7c9y8ldU0AUQTRF
         5fbsNwaJ5V5CVPkE/WmEDjWSsupUQmJz7JejLn1ycEheZ0lrCnV4K0GtDeJF0gFuQpGj
         0jR28UnBGE3CehkFpZhwwZ05nnKXlU7PpMDewp6xdtbI0kP7nYRPNXLqJLXs7Iei8IXG
         HvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+q5Opz1z0wRg1NqzZx58OYZGGiibmuJzUjuRhMUUaD4=;
        b=uksCzwneiPio1zo4HQyBcjbEZnSwbZ4d+SNTM2M2234aJLHUFHH5Xmp9wsL01XYj53
         LgCkLRQFezjKl/1OAS0EETwnout6sO0QS0ghRzRQoEd8jQ7nIkQCWRDUsnx2eKnFSHv6
         7kZtsPfFY0d5DBYiPzuKNbDCCgDGKFTb6BQj5vqKyyuf8nad6fuLOzW4Wmo/azDhkG64
         XAJaZ9frTy3YvKM8K9tBA9siDkuBmbB7h+UCnan4J3rAJfCbcGfKZJgwp0QQImgkQVRu
         /uRxJ+vVywZfn9EWftACXUUTUZrRDhMNfSMmiejzpkvhkjlepmqY31bfnYenUEJxRXc5
         s88A==
X-Gm-Message-State: AOAM53165ol5shI6a1eTzrsPrrZqioE33y7asEEDxzwaLipNP1ey1bnR
        KfqesQa9pS6b7e8xWG4Mtpk=
X-Google-Smtp-Source: ABdhPJzuszx1IYSaePVGH2nrCCicDhTEPO1AN5OeeW/CUfX8imZqHypcHazl6Hz4UH54ae1Q5BQhPA==
X-Received: by 2002:a2e:2414:: with SMTP id k20mr14179551ljk.24.1593040995236;
        Wed, 24 Jun 2020 16:23:15 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id 203sm1782546ljf.14.2020.06.24.16.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 16:23:14 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3703cf87-457a-0e71-7693-5644735e438a@gmail.com>
Date:   Thu, 25 Jun 2020 02:23:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.06.2020 15:09, Mikko Perttunen пишет:
> 
> struct drm_tegra_channel_submit {
>         __u32 channel_id;
>         __u32 flags;
> 
>         /**
>          * [in] Timeout in microseconds after which the kernel may
>          *   consider the job to have hung and may reap it and
>          *   fast-forward its syncpoint increments.
>          *
>          *   The value may be capped by the kernel.
>          */
>         __u32 timeout;

What about to rename this to timeout_us? For clarity.

>         __u32 num_syncpt_incrs;
>         __u32 num_relocations;
>         __u32 num_commands;
> 
>         __u64 syncpt_incrs;
>         __u64 relocations;
>         __u64 commands;

Let's also add "_ptr" postfix to all usrptr names, again for clarity.

It's always nice to have meaningful names :)
