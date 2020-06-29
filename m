Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF64820E922
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 01:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729416AbgF2XMP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Jun 2020 19:12:15 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42357 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727819AbgF2XMP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Jun 2020 19:12:15 -0400
Received: by mail-io1-f65.google.com with SMTP id c16so19022582ioi.9;
        Mon, 29 Jun 2020 16:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=op3i3z1L0LUQ12QfWOlDxJhiavChzqvWXr19iexaQZg=;
        b=OQzAAqKgEHjysFnvuLkZfU2XFlsLpr0eaUkY8EMniHyH0G5kodDF9FgBMkzBl/HqFL
         drCzXwx48IIoGURyAYf2Xo7wKl1A14t460pQ0R25dpeBRRdvjycuuVuB772WOwbbTeOi
         9ov/q94D8bM5Txp9Eo6BiI9CEStufSoVaVpXd0fdL9S8D9nlsIeIjj72UGYeNGGsLaay
         5Ep0rAX60qJFRINmHM86LJ4t5nTGxa7hpKsCvsQQhtzwFkkoKPT0kJSvSboHv4Tnr8To
         bQnHx/+MEZEigLR+MPNKhFj3L2cu/RgzAFJYG1PXVT+Eiq3QO9XU4p4It23IkOuDChIH
         c7dg==
X-Gm-Message-State: AOAM531U23dmZDLqHOxmAMymURqUCw0i0AUF/gXCUPhPrF/weccACake
        bPYsDvjX3F7ciHUWjmQd6w==
X-Google-Smtp-Source: ABdhPJwqWxmbojLKjuDjx9fPibAgiAZ1p7u7BMvYsmcT/Qp0Zxzr9XR5iIvt0bzy9xxkhE4ie/Qu6w==
X-Received: by 2002:a02:8796:: with SMTP id t22mr13133151jai.90.1593472334118;
        Mon, 29 Jun 2020 16:12:14 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id e4sm697936ilq.68.2020.06.29.16.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 16:12:13 -0700 (PDT)
Received: (nullmailer pid 3148645 invoked by uid 1000);
        Mon, 29 Jun 2020 23:12:11 -0000
Date:   Mon, 29 Jun 2020 17:12:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Rowand <frowand.list@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/7] of_graph: add of_graph_presents()
Message-ID: <20200629231211.GA3142766@bogus>
References: <20200617222703.17080-1-digetx@gmail.com>
 <20200617222703.17080-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617222703.17080-2-digetx@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jun 18, 2020 at 01:26:57AM +0300, Dmitry Osipenko wrote:
> In some case, like a DRM display code for example, it's useful to silently
> check whether port node exists at all in a device-tree before proceeding
> with parsing of the graph.
> 
> This patch adds of_graph_presents() that returns true if given device-tree
> node contains OF graph port.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/of/property.c    | 52 +++++++++++++++++++++++++++++++++-------
>  include/linux/of_graph.h |  6 +++++
>  2 files changed, 49 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 1f2086f4e7ce..b84ed6a7cf50 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -29,6 +29,48 @@
>  
>  #include "of_private.h"
>  
> +/**
> + * of_graph_get_first_local_port() - get first local port node
> + * @node: pointer to a local endpoint device_node
> + *
> + * Return: First local port node associated with local endpoint node linked
> + *	   to @node. Use of_node_put() on it when done.
> + */
> +static struct device_node *
> +of_graph_get_first_local_port(const struct device_node *node)
> +{
> +	struct device_node *ports, *port;
> +
> +	ports = of_get_child_by_name(node, "ports");
> +	if (ports)
> +		node = ports;
> +
> +	port = of_get_child_by_name(node, "port");
> +	of_node_put(ports);
> +
> +	return port;
> +}
> +
> +/**
> + * of_graph_presents() - check graph's presence
> + * @node: pointer to a device_node checked for the graph's presence
> + *
> + * Return: True if @node has a port or ports sub-node, false otherwise.
> + */
> +bool of_graph_presents(const struct device_node *node)

of_graph_is_present

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
