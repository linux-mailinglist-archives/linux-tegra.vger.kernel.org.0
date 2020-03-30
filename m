Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88A9A198231
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Mar 2020 19:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgC3RXT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Mar 2020 13:23:19 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52635 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727981AbgC3RXT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Mar 2020 13:23:19 -0400
Received: by mail-wm1-f65.google.com with SMTP id z18so20837430wmk.2
        for <linux-tegra@vger.kernel.org>; Mon, 30 Mar 2020 10:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q24kAT4cbBzb52ml0mrJ9XPb0BLvQ4SNvzCusOKhh+s=;
        b=OV7E0xLAZMv4x3idXCl7dHmUawT5p3kdnnJ6EDUl9dJOjdECqRwRoVb+DhWgjTlW4s
         CMMVyz+IynkHHRY6s/ztv9FXSqM16EUIJ4DvWAmASNhDQahnmY3p55zbYo+5Zq0T4at/
         QUdNRA1XJq+xJwXw46RBwYT6Jq6uAur4I8BXDu523AJ+lz2yR7aDAXUqtmLqOBT+mpoi
         LXUG0spsxiYegyssLSTCz63LWA+b3Kfj6+yZS07b7G4CEEYr9pMBKp3JjlpkN7HhTUua
         qYW0DO0C8qRwszI+bHzTOwQDbLXa05DzpJOg99EDF9e5aBjPTwjpiOf1beQERPL1jeNS
         NURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Q24kAT4cbBzb52ml0mrJ9XPb0BLvQ4SNvzCusOKhh+s=;
        b=f1n471oK34MIyW/2M1y/f4o4XugHbgHxGooXLnCHOG1AsZrtEW4n4vQN+CM6Y7aqqD
         xBcoBwBx7vevfxYMkF38vxEhRS879JkRJkcnucryxfySMYHS0X5bivcmWj6c5M8fE53Q
         lTGv4mQSMRWaZPg9qVvpf0kYnBAMhpkkyWfn14jHakOZBSv9tR16G05PVdIstnhW60er
         3BBa9ULdvA+EPdTnBcF68UU3OT9y/O9olgqSoThcx/sHWLbybNHGeI8C43tqaoDW3IbX
         y3thyT9LoE2V8VVj73f3645/yvrtNWJU5YK5JHNRigXBOUd2ht4zhIohNlZoD+Zqm152
         OXow==
X-Gm-Message-State: ANhLgQ1l5bMJ1zg4+XyJ398piT5g2fxczPq8ULIjlhw/8EQPWUfeqE7U
        YU4XoRv0zztlJRVKOdZEltstAA==
X-Google-Smtp-Source: ADFU+vtjxzsMF25IoF68+qDYw1jMScPewztW7xCYz9TmB+LbGcyyLpp1VmBNGkr2Zdl8T5vKiXiFyw==
X-Received: by 2002:a05:600c:2306:: with SMTP id 6mr342437wmo.86.1585588996346;
        Mon, 30 Mar 2020 10:23:16 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:b9f1:f2a9:a3f0:308? ([2a01:e34:ed2f:f020:b9f1:f2a9:a3f0:308])
        by smtp.googlemail.com with ESMTPSA id j6sm24349348wrb.4.2020.03.30.10.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 10:23:15 -0700 (PDT)
Subject: Re: [PATCH v7 3/3] thermal: tegra: add get_trend ops
To:     Wei Ni <wni@nvidia.com>, edubezval@gmail.com
Cc:     thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        rui.zhang@intel.com, srikars@nvidia.com,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <1546510369-28491-1-git-send-email-wni@nvidia.com>
 <1546510369-28491-4-git-send-email-wni@nvidia.com>
 <bae5b0c3-3d7f-0b60-da96-730c7e8c4e5c@linaro.org>
 <ecabe3d8-274f-7c0e-f875-6968c65a4425@nvidia.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <156ef39f-4bb2-c7fb-7bf0-abc9e0067c62@linaro.org>
Date:   Mon, 30 Mar 2020 19:23:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ecabe3d8-274f-7c0e-f875-6968c65a4425@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Wei,

On 19/02/2019 03:15, Wei Ni wrote:

>>> +static int tegra_thermctl_get_trend(void *data, int trip, +
>>> enum thermal_trend *trend)

[ ... ]

>>> +	temp = tz->temperature; +	last_temp = tz->last_temperature; +
>>> mutex_unlock(&tz->lock); + +	if (temp > trip_temp) { +		if
>>> (temp >= last_temp) +			*trend = THERMAL_TREND_RAISING; +
>>> else +			*trend = THERMAL_TREND_STABLE; +	} else if (temp <
>>> trip_temp) { +		*trend = THERMAL_TREND_DROPPING; +	} else { +
>>> *trend = THERMAL_TREND_STABLE; +	} + +	return 0; +} + static
>>> const struct thermal_zone_of_device_ops tegra_of_thermal_ops =
>>> { .get_temp = tegra_thermctl_get_temp, .set_trip_temp =
>>> tegra_thermctl_set_trip_temp, +	.get_trend =
>>> tegra_thermctl_get_trend, };

It has been awhile since this patch was submitted and merged by
Eduardo. I replace him to co-maintain the thermal framework with Rui.

While figuring out the internals for code cleanup, I ended up in this
function above.

Why do you have to use this routine instead of the generic one in
get_tz_trend()?



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
