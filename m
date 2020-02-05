Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB8EB153673
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2020 18:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgBER3h (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Feb 2020 12:29:37 -0500
Received: from mail-wr1-f45.google.com ([209.85.221.45]:43180 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgBER3g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Feb 2020 12:29:36 -0500
Received: by mail-wr1-f45.google.com with SMTP id z9so3723700wrs.10
        for <linux-tegra@vger.kernel.org>; Wed, 05 Feb 2020 09:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZbbVXu4SMR7d0kvLiQS3/WRJNZMT3pLKeUkPSOah+pw=;
        b=TjTCzDElpVqRK0mbmDJrFQQI6dOnqTXa+gzoY8mELNCoPb48hh/vJW0wHBe4Fqcb57
         An3mGJVxLOYtrxusYQaCDV6w0CyMgtMMrAex28DrF7U/y43lnKVAQNSLDdKITVftQdBz
         DH2MUpbqQTKmr4ASjC+f/KAnhdgXWMpNLT6mxiHf22/hjIpv4+vOJjD0dEceMQPkx+DZ
         nnPqYZILwsqPFgatCjZrXhXumi0zu65As9DEz+1giXHuM2+BHLNezWoC/yv2UIMVcVE8
         n8xo9Zib4X7SrhylbJRzef6CYd1JhGTu5B9ERQunrLNtA5oJ7sMwJaFU5c95FCjm2PEq
         HTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZbbVXu4SMR7d0kvLiQS3/WRJNZMT3pLKeUkPSOah+pw=;
        b=EOPlYWt1MNHYSAqZGNMZbxIEEsErKiKQV0C9ZaOwtj4w5Afgf9e/QyqrJY5vxT/95l
         6yYhQK0jBXQGqUD/w5GCEvrYEXK2Te4RJX1V6Kn2NwhTA1SWJ/sQgBvdCywOiSLZQa+c
         GnAUYG+5vrrCioY9QXQzxqJm3277EEbtKek2Gqq7MWqLCknhSdoo22iDf2xGqvw1MuMR
         ANOk5Lz+t3qHMfdUcatnSirnnd5erUyWkQjvVxn9eDSzHEQxOREyAUa1XLZICn0iqyF3
         c+p6+2lolslYDqHSitsNavw1NMda+MpPVrTSHdUkOsDehKnpjZ3WvTFkJmhFn6JxKOxw
         hTEg==
X-Gm-Message-State: APjAAAUnR9vr2M4W0f1QzXzWifwc9KQU6MfCp34+XbqV2+vzPSX9zjGB
        OmNBFVhOFjQPXiWxUBBOYGI=
X-Google-Smtp-Source: APXvYqydiYwvC0cS3GL1m4tH/oop1je+OBYgSQlVdms6CmkC/IHHYZdm9bKmu9knw+jPVtTJt/fArw==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr31502155wrn.254.1580923774984;
        Wed, 05 Feb 2020 09:29:34 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id q10sm312198wme.16.2020.02.05.09.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 09:29:34 -0800 (PST)
Subject: Re: [PATCH 2/3] drm/tegra: Reuse IOVA mapping where possible
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-3-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <af7c156e-937b-e8fd-2a84-2e54671b7ed8@gmail.com>
Date:   Wed, 5 Feb 2020 20:29:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204135926.1156340-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.02.2020 16:59, Thierry Reding пишет:
> -		sgt = host1x_bo_pin(host->dev, g->bo, NULL);
> +		/**
                  ^
Although one nit: ^ the second asterisk isn't needed :)
