Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0139F605B
	for <lists+linux-tegra@lfdr.de>; Sat,  9 Nov 2019 18:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfKIRBP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 9 Nov 2019 12:01:15 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35346 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfKIRBP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 9 Nov 2019 12:01:15 -0500
Received: by mail-lj1-f194.google.com with SMTP id r7so9450547ljg.2;
        Sat, 09 Nov 2019 09:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YsEdvLSqshkQAKsr6hOPBmd5nkHl6aHOD1uqXbjxBps=;
        b=I8Gl2ifBFWfJa9BHh/OMpGqvpjGAvjkKvzGZXl2wGEjzByDTV9+oVfqGX+n7e/h5Vx
         5v+C5gqGK/Ux1wHWk9/UJxx9Y82hE287cxPSeT8va0780dpZY2gGPzydvg7MO5fYY2Oh
         kLd3KHBZBB/1tfYKDqwN0gFEsJp7xf2+cwfWDoajhIcOOU5SC/pUDJaIFwCgw/RIrR5l
         SyDpPQ5k0o8lsPn1jQGd+ABar8AF/rNnBZDHzHo1ZI/ORdO51LXW1Mgx2hr2Tp7Eo9Vm
         1Kcak02my7uDQsxsGUUAwF568E+y1KHEecZYVoyykE5pU+i4bDUlWyhyHCXkful8sA/z
         m1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YsEdvLSqshkQAKsr6hOPBmd5nkHl6aHOD1uqXbjxBps=;
        b=SocW/kEj1sjS0/KkGN9pprGAjbIEbg5CCJDvt6ciERTMp03fQ5QBKu6xS2gx6Gini7
         YOgBurr66EsBSDZ8ttOUjvD8HzvVwrawxfTj9ximnVngSw+npR15KBF/HSFVixd4YMzq
         EZ00tDkWuxcjc/YVMpeA6kdPgHzA2mFtkkwAoSifaHWWuY4N657l0NiCvuSAskq6yUww
         BhinlNUXhrOtViO+awjhiViOweAqfH2y9uIITFjMqoMQAt09HvME+KLEYPrDOsT9CjxB
         96Io4KWm/hHB8a3MW8RK2S68E400EgkrWhcho92tSYLT55rgcDYEYtqX+DonbSCsr0pu
         yZGA==
X-Gm-Message-State: APjAAAWdM0Kpk6OGv9H81zz8cSFkc4hg04CYXF5YI3adCxHVB7twRlfR
        R7UUSYTzchNv6OnwDX3Z7xPEuDZZ
X-Google-Smtp-Source: APXvYqyE/ix40hJWKggx9LGza4SIxbY2YL0VAbnM8y5of/UN4Kqt8hK8dapqqmS5eMVVL0XyTlfu5Q==
X-Received: by 2002:a2e:97d3:: with SMTP id m19mr3225729ljj.56.1573318872490;
        Sat, 09 Nov 2019 09:01:12 -0800 (PST)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id u27sm4069847lfl.34.2019.11.09.09.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2019 09:01:11 -0800 (PST)
Subject: Re: [PATCH v2] drm/tegra: Turn off and reset hardware across
 suspend-resume
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190811183932.15850-1-digetx@gmail.com>
Message-ID: <4280db25-98cb-b47b-06c8-0666f364dea3@gmail.com>
Date:   Sat, 9 Nov 2019 20:01:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190811183932.15850-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.08.2019 21:39, Dmitry Osipenko пишет:
> The drivers core bumps runtime PM refcount during of entering into
> suspend to workaround some problem where parent device may become turned
> off before its children. In order to disable and reset CRTCs/HDMI/etc
> hardware, the runtime PM needs to be "forced" into suspend mode.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Hello Thierry,

Is there any particular reason why you're skipping this patch?
The driver's suspend-resume doesn't work properly without it.
